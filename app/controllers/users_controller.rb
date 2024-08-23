class UsersController < ApplicationController
  before_action :set_user
  before_action :require_login, only: %i[show edit]

  def show
  end

  def edit
  end

  def update
    @user = User.
  end



  private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
