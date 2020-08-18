class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new
    # edit
  end

  def create
    user = User.find_by(name: params[:sessions][:name])
    if user.present?
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:alert] = 'Signup before you login'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have signed out successfully'
    redirect_to root_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:alert] = 'You are already logged in!'
    redirect_to root_path
  end
end
