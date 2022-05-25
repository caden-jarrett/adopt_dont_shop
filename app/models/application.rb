class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pet, through: :pet_applications
  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :status

  # enum :status, [:in_progress, :pending, :approved, :rejected]

  def status_pending
    update(status: "Pending")
  end

  # def app_status_update(pet_application)
  #   # binding.pry
  #   @application = pet_application.application
  #   pet_apps_stati = @application.pet_applications.pluck(:status)
  #   if pet_apps_stati.any? == "Denied"
  #     pet_application.application.update(status: "Rejected")
  #   elsif pet_apps_stati.all? == "Approved"
  #     pet_application.application.update(status: "Approved")
  #   end
  # end

end
