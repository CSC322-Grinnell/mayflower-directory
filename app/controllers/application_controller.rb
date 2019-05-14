class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def hello
    render html: "Kathryn Yetter"
  end
  
  def yourein
    render html: "Jong Hoon Bae"
  end
  protected
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
