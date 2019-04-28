class ProfilesController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :create, :destroy, :new]

  def import
    Profile.import(params[:file])
    redirect_to root_url, notice: "Profiles imported."
  end

  def index
    @search = Profile.ransack(params[:q])

    all_results = @search.result.order("last_name ASC, first_name ASC")

    bucket = get_bucket
    @results = all_results.map do |profile|
      if profile.nickname.present?
        name = "#{profile.last_name}, #{profile.nickname} (#{profile.first_name})"
      else
        name = "#{profile.last_name}, #{profile.first_name}"
      end

      {
        :name => name,
        :image_url => profile_image(profile, bucket),
        :link => profile_path(profile.id)
      }
    end
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
      redirect_to profiles_path
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
    @image_url = profile_image(@profile, get_bucket)
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
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def profile_params
      params.require(:profile).permit(
        :first_name, :last_name, :nickname, :landline, :cell, :email, :address,
        :neighborhood, :spouse, :biography, :avatar
      )
    end

    def get_bucket
      s3 = Aws::S3::Resource.new(
        region: 'us-east-2',
        credentials: Aws::Credentials.new(
          ENV['AWS_ACCESS_KEY_ID'],
          ENV['AWS_SECRET_ACCESS_KEY']
        )
      )

      s3.bucket('mayflower-data')
    end

    def profile_image(profile, bucket)
      folder_name = "images"
      base_filename = "#{profile.last_name}, #{profile.first_name}"
      png_filename = "#{base_filename}.png"
      jpg_filename = "#{base_filename}.jpg"
      default_url = view_context.image_url("Mayflower_Default_Photo.jpg")

      begin
        if not profile.avatar.file.nil?
          return profile.avatar.url
        elsif bucket.object(File.join(folder_name, jpg_filename)).exists?
          uploader = AvatarUploader.new
          uploader.retrieve_from_store!(jpg_filename)
          return uploader.url
        elsif bucket.object(File.join(folder_name, png_filename)).exists?
          uploader = AvatarUploader.new
          uploader.retrieve_from_store!(png_filename)
          return uploader.url
        else
          return default_url
        end
      rescue Aws::S3::Errors::BadRequest
        return default_url
      end
    end
end
