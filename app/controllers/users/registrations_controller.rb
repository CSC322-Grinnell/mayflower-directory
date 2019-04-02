class Users::RegistrationsController < Devise::RegistrationsController
  before_action :logged_in_admin, only: [:create,:new]
  before_action :configure_sign_up_params, only: [:create]

# Is no authentication required?
   def require_no_authentication
   end
   
# Confirms a logged-in user as admin.
   def logged_in_admin
     unless current_user && current_user.admin
       flash[:danger] = "Please log in as admin."
       redirect_to '/home'
     end
   end
   
  def import_users
    file = params[:file]
    if ! file
      flash[:danger] = "No file specified"
      redirect_to '/auth/register/sign_up'
    else
      User.import(file)
      redirect_to static_pages_search_path, notice: "User data imported!"
    end
  end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   def update
     super
   end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
    user.permit(:id, :name, :email, :password, :password_confirmation)
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end
end
