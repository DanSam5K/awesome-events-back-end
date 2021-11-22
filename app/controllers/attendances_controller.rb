class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.attending_events.where('date_of_event > ?', Time.now.to_s.split[0]).order(:date_of_event),
           status: :ok
  end

  def create
    unless current_user.attendances.find_by(attendance_params)
      @attendance = current_user.attendances.build(attendance_params)
    end

    if @attendance&.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance&.errors, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
