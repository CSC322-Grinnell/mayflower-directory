class ProfilesController < ApplicationController
  def new
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
  
  def index
    @search = Profile.search(params[:q])
    @profiles = @search.result
  end
end
