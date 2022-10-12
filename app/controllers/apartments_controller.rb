class ApartmentsController < ApplicationController
  def index
    @apartments = ['Apartment 1', 'Apartment 2', 'Apartment 3']
  end

  def new 

  end

  def create
    # require 'pry'; binding.pry
    apartment = Apartment.new({
      apt_name: params[:apartment][:apt_name],
      has_wd: params[:apartment][:has_wd],
      created_at: params[:apartment][:created_at],
      updated_at: params[:apartment][:updated_at],
      unit_count: params[:apartment][:unit_count],
      city: params[:apartment][:city],
      state: params[:apartment][:state],
      pet_friendly: params[:apartment][:pet_friendly],
    })
    apartment.save

    redirect_to '/apartments'
  end
end