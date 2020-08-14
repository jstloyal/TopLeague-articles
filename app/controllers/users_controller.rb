class UsersController < ApplicationController
  before_action :require_same_user, only: %i[edit update show]
  before_action :require_admin, only: [:destroy]
  before_action :find_user, only: %i[edit update show]

  def new
    @user = User.new
  end

  def show
    # show
  end

  def edit
    # edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully! Welcome #{@user.name}"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = 'Error! User not created please try another name.'
      render 'new'
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = 'User and all user article is successfully deleted'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return unless current_user != @user && !current_user.admin?

    flash[:danger] = 'You can only edit your own account'
    redirect_to root_path
  end

  def require_admin
    return unless logged_in? && !current_user.admin?

    flash[:danger] = 'Only admin can perform this action!'
    redirect_to root_path
  end
end
