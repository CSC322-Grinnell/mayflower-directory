class StaffsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
    @search = Staff.ransack(params[:q])

    all_results = @search.result.order("last_name ASC, first_name ASC")

    # bucket = get_bucket
    @results = all_results.map do |staff|
      if staff.nickname.present?
        name = "#{staff.last_name}, #{staff.nickname} (#{staff.first_name})"
      else
        name = "#{staff.last_name}, #{staff.first_name}"
      end

      {
        :name => name,
        :image_url => staff_image(staff, bucket),
        :link => staff_path(staff.id)
      }
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    @staff = Staff.find(params[:id])
    @image_url = staff_image(@staff, get_bucket)
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def staff_image(staff, bucket)
      folder_name = "images"
      base_filename = "#{staff.last_name}, #{staff.first_name}"
      png_filename = "#{base_filename}.png"
      jpg_filename = "#{base_filename}.jpg"
      default_url = view_context.image_url("Mayflower_Default_Photo.jpg")

      begin
        if not staff.avatar.file.nil?
          return staff.avatar.url
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit!
    end
end
