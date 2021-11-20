class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendance = current_user.attendances.build(attendance_params)

    if @attendance.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.permit(:event_id)
  end
end
