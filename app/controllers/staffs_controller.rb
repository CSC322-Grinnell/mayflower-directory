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
        :image_url => staff.avatar.url,
        :link => staff_path(staff.id)
      }
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    @staff = Staff.find(params[:id])
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
    @staff = Staff.find(params[:id])
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
    @staff = Staff.find(params[:id])
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
    @staff = Staff.find(params[:id])
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit!
    end
end
