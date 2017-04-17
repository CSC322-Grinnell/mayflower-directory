class ProfilesController < ApplicationController
  def new
  end
  
  def index
    @search = Profile.search(params[:q])
    @profiles = @search.result
  end
end
