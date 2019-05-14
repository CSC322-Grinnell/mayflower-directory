class ProfilesController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :create, :destroy, :new, :import]

  def import
    Profile.import(params[:file])
    redirect_to root_url, notice: "Profiles imported."
  end

  def index
    @search = Profile.ransack(params[:q])
    @results = @search.result.order("last_name ASC, first_name ASC")
  end

  def new
    @user = Profile.new
  end

  def edit
    @user = Profile.find(params[:id])
  end

  def search
    @user = Profile.search(params[:search])
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update_attributes(profile_params)
      CacheProfileAvatarService.new.refresh!(profile)
      flash[:success] = "Profile updated"
      redirect_to profile_path(profile)
    else
      render 'edit'
    end
  end

  def create
    profile = Profile.new(profile_params)
    if profile.save
      CacheProfileAvatarService.new.refresh!(profile)
      flash[:success] = "Profile created"
      redirect_to profile_path(profile)
    else
      flash[:notice] = "There was a problem creating the new profile"
      redirect_to new_profile_path
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

    redirect_to profiles_path
  end

  def get_dataset
    render json: { data: Profile.all }
  end

  private
    def profile_params
      params.require(:profile).permit(
        :first_name, :last_name, :nickname, :landline, :cell, :email, :address,
        :neighborhood, :spouse, :biography, :avatar
      )
    end
end
