class ApplicationsController < ApplicationController

  def index
  end

  def show
    @application=Application.find(params[:id])
    @pets = Pet.all
    if params[:search].present?
      @pets = Pet.search(params[:search])
    end

    @chosen_pets = @application.pet 

    if @chosen_pets.present? && @application.description.present?
      @application.update ({description: params[:description]})
      @application.save
      @application.status_pending 
    end
  end

  def new
  end

  def create
    @application = Application.create(application_params)
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "Application not created: required information missing."
      redirect_to '/applications/new'
    end
  end

  def update
    # binding.pry
    application = Application.find(params[:id])
    application.update(application_params)
    redirect_to "/applications/#{application.id}"
  end

private

  def application_params
    params.permit(:name, :pets, :street_address, :city, :state, :zipcode, :status, :description, :id)
  end
end
