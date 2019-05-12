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
    @user = Profile.find(params[:id])
    if @user.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path(@user.id)
    else
      render 'edit'
    end
  end

  def create
    puts "*** CREATING A NEW PROFILE ****"
    puts "Params object:" + profile_params.to_s
    puts "Params hash:  " + profile_params.to_unsafe_h.to_s
    avatar = profile_params.delete(:avatar)
    puts "Avatar:       " + avatar.to_s

    @user = Profile.new(profile_params)
    #puts "User is "
    #puts @user.to_s
    if @user.save
      flash[:notice] = "Profile sucessfully added"
      redirect_to '/profiles/' + @user[:id].to_s
    else
      puts "** Could not save profile"
      puts @user.errors.full_messages
      flash[:notice] = "there was a problem creating the new profile"
      redirect_to '/profiles/new'
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
