class UsersController < ApplicationController

  before_action :admin_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def edit_info
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User password updated"
      redirect_to users_path
    elsif user_params.include?(:password)
      flash[:notice] = "Password is invalid."
      render 'edit_password'
    else
      flash[:notice] = "Either name or email is invalid."
      render 'edit_info'
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password,
                                   :password_confirmation, :admin)
    end

end

