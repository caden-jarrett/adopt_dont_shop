class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pet_applications = @application.pet_applications
  end

  def update
    pet_application = PetApplication.find(params[:id])
    pet_application.update(status: params[:status])
    pet_application.save
    @application = pet_application.application
    # @application.app_status_update(pet_application)
    redirect_to "/admin/applications/#{@application.id}"
  end
end