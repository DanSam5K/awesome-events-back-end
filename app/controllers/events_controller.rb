class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:destroy]

  def index
    if params[:type] == 'created'
      render json: current_user.events, status: :ok
    else
      render json: Event.all, status: :ok
    end
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.creator_id == current_user.id
      Cloudinary::Uploader.destroy(@event.image.split('/')[-3..].join('/').split('.')[0], invalidate: true)
      @event.destroy
      render json: { message: 'Event successfully deleted' }, status: :ok
    else
      render json: { message: 'You can\'t delete this event' }, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    image = Cloudinary::Uploader.upload(params[:image], folder: 'awesome_events')
    params.permit(:name, :description).merge(image: image['url'])
  end
end
