class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_out

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action'
    redirect_to root_path
  end
end
