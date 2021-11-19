class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    image = Cloudinary::Uploader.upload(params[:image])
    params.permit(:name, :description, :date_of_event, :city, :country).merge(image: image['url'])
  end
end
