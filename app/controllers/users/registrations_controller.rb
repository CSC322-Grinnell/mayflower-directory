class Users::RegistrationsController < Devise::RegistrationsController
  before_action :logged_in_admin, only: [:create,:new]
  before_action :configure_sign_up_params, only: [:create]
  # before_action :require_no_authentication, only: [:create,:new]

  #before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]


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
      redirect_to profiles_path, notice: "User data imported!"
    end
  end

  # GET /resource/sign_up
  # def new
  #    super
  # end

  # POST /resource
   def create
        if params[:admin]
        end
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

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

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

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
