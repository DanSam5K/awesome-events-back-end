class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:destroy]

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
      Cloudinary::Uploader.destroy(@event.image)
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
    image = Cloudinary::Uploader.upload(params[:image], folder: 'awesome_events/cache')
    params.permit(:name, :description, :date_of_event, :city, :country).merge(image: image['url'])
  end
end
