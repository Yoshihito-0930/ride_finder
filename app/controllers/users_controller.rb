class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  before_action :require_login, only: %i[show edit]

  def show
  end

  def edit
  end

  def update
    @user = current_user.boards.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), success: t('defaults.flash_message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Board.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end



  private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
