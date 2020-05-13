class IntakeProfilesController < ApplicationController
    before_action :admin_user, only: [:edit, :update, :create, :destroy, :new, :import]

    def index
        @intake_profiles = IntakeProfile.all
    end

    def new
        @newintake = IntakeProfile.new
    end

    def update
    end
    
end