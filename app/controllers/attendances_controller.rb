class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance, only: [:destroy]

  def index
    attending_events = current_user
      .attendances.where('date > ?', Time.now.to_s.split[0])
      .order(:date)
      .map do |attendance|
        event = Event.find(attendance.event_id)
        creator = User.find(event.creator_id)
        {
          name: event.name,
          description: event.description,
          id: attendance.id,
          image: event.image,
          creator_id: creator.id,
          creator_name: creator.name,
          date: attendance.date,
          city: attendance.city
        }
      end
    render json: attending_events, status: :ok
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

  def destroy
    if current_user.id == @attendance.attendee_id
      @attendance.destroy
      render json: {}, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:event_id, :date, :city)
  end
end
