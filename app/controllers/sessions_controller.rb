class SessionsController < ApplicationController
  def new; end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:success] = 'ログインしました'
    redirect_to root_path
  rescue OmniAuth::Strategies::OAuth2::CallbackError
    flash[:alert] = 'ログインに失敗しました。再度お試しください。'
    redirect_to login_path
  end

  def destroy
    reset_session
    flash[:info] = 'ログアウトしました'
    redirect_to root_path, status: :see_other
  end

  def failure
    flash[:alert] = 'ログインに失敗しました。再度お試しください。'
    redirect_to login_path
  end
end
