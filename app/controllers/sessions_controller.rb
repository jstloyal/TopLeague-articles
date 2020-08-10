class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'
      redirect_to articles_path
    else
      flash.now[:alert] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have signed out successfully'
    redirect_to root_path
  end
end
