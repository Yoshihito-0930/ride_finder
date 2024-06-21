class SessionsController < ApplicationController
  def new; end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = 'ログインしました'
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:info] = 'ログアウトしました'
    redirect_to root_path, status: :see_other
  end
end
