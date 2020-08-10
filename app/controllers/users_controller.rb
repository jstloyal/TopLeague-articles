class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Error! User not created please try another name."
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
