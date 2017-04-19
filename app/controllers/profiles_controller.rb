class ProfilesController < ApplicationController
  #before_action :logged_in_admin, only: [:edit, :update, :create, :index]
  def new
    @profile = Profile.new
  end
  
  def edit
    @user = Profile.find(params[:id])
  end
  
  def profile_params
      params.require(:profile).permit(:first_name, :last_name)
  end
   
  def update
    @user = Profile.find(params[:id])
    if @user.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to '/static_pages/home'
    else
      render 'edit'
    end
  end
  
  def create
    @user = Profile.new(params[:id])
    if @user.save(profile_params)
      flash[:notice] = "profile sucessfully added"
      redirect_to @user
    else 
      flash[:notice] = "there was a problem creating the new profile"
      render action 'profile/new'
    end
  end
  
  def index
    @search = Profile.search(params[:q])
    @profiles = @search.result
    @user = Profile.all
  end 
  
  # Confirms a logged-in user as admin.
  # def logged_in_admin
  #   unless current_user.admin
  #     flash[:danger] = "Please log in as admin."
  #     redirect_to '/static_pages/home'
  #   end
  # end
  
 def show
   @user = Profile.find(params[:id])
 end
end
