class StaticPagesController < ApplicationController

  class Staff
    @first_name
    @last_name
    @image
    attr_accessor :first_name, :last_name, :image
    def initialize first_name, last_name, image
      @first_name = first_name
      @last_name = last_name
      @image = image
      puts @first_name
      puts @last_name
    end
  end

  def home
  end

  def help
  end

  def about
  end

  def departments
  end

  def library
  end

  # def search
  #   if current_user.newUser != false
  #     current_user.newUser = false
  #     current_user.save
  #     redirect_to "/auth/register/edit"
  #   end
  # end

end