class LoggedUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { user: { name: current_user.name, email: current_user.email } }
  end
end
