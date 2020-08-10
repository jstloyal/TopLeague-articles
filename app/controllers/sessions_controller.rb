class SessionsController < ApplicationController
  def new

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
end
