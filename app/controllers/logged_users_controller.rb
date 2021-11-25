class LoggedUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { user: { name: current_user.name, id: current_user.id } }
  end
end
