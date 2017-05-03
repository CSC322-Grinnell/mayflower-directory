class ProfilesController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :create, :index, :destroy]
  
  def new
    @user = Profile.new
  end
  
  def edit
    @user = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :nickname, :landline, :cell, :email, :address, :neighborhood, :spouse)
  end
   
  def update
    @user = Profile.find(params[:id])
    if @user.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to '/static_pages/search'
    else
      render 'edit'
    end
  end
  
  def create
    puts "*** CREATING A NEW USER ****"
    puts profile_params
    @user = Profile.new(profile_params)
    #puts "User is "
    #puts @user.to_s
    if @user.save
      flash[:notice] = "profile sucessfully added"
      redirect_to '/profiles/' + @user[:id].to_s
    else 
      flash[:notice] = "there was a problem creating the new profile"
      render action 'profile/new'
    end
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
    @profile = Profile.find(params[:id])
  end
  
  def display
    @allProfiles = Profile.all
  end
  
  def destroy
    Profile.find(params[:id]).destroy
    flash[:success] = "Profile deleted"
    redirect_to '/static_pages/display'
  end
end
