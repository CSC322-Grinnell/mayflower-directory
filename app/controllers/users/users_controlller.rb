class ProfilesController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :create, :index]
  before_action :require_no_authentication, only: [:sign_up]
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  def index
    @search = Profile.search(params[:id])
    @profiles = @search.result
    @user = Profile.all
  end 
  
  # Confirms a logged-in user as admin.
  def logged_in_admin
    unless current_user.admin
     flash[:danger] = "Please log in as admin."
     redirect_to '/static_pages/home'
    end
  end
  
  def show
    @user = Profile.find(params[:id])
  end
  
  def display
    @allProfiles = Profile.all
  end
  
end
