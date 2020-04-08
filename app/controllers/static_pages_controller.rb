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
    @library_link = LibraryLink.order('id').first
    if(!params[:library_link].nil?)
      if @library_link.update_attributes(:list_by_title => params[:library_link][:list_by_title],
                                        :list_by_author => params[:library_link][:list_by_author],
                                        :browing_collection => params[:library_link][:browing_collection])
        flash[:success] = "Successful Update!"
      # Handle a successful update
      else
        flash[:notice] = "Update unsuccessful! Please contact maintenance team for help."
      end
    end
  end


  # def search
  #   if current_user.newUser != false
  #     current_user.newUser = false
  #     current_user.save
  #     redirect_to "/auth/register/edit"
  #   end
  # end

end
