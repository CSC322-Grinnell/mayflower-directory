class StaticPagesController < ApplicationController
  def home
  end
  
  def help
  end
  
  def about
  end
  
  def search
    if current_user.newUser != false
      current_user.newUser = false
      current_user.save
      redirect_to "/auth/register/edit"
    end
  end
  
end