class UsersController < ApplicationController
  before_action :set_user
  before_action :require_login, only: %i[show]

  def show
  end

  private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
