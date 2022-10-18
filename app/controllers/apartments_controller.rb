class ApartmentsController < ApplicationController
  def index
    @apartments= Apartment.all.order_by_created_at  
  end

  def new 

  end

  def create
    apartment = Apartment.new(apartments_params)
    apartment.save
    redirect_to '/apartments'
  end

  def show 
    @apartment = Apartment.find(params[:id])
  end

  def edit 
    @apartment = Apartment.find(params[:id])
  end

  def update 
    apartment = Apartment.find(params[:id])
    apartment.update(apartments_params)
    apartment.save 
    redirect_to "/apartments/#{apartment.id}"
  end

  def destroy
    apartment = Apartment.find(params[:apartment_id])
    apartment.destroy
    redirect_to '/apartments'
  end

private
  def apartments_params
    params.permit(:apt_name, :has_wd, :unit_count, :city, :state, :pet_friendly)
  end
end