class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def logged_in?
    !!session[:user_id]
  end
end
