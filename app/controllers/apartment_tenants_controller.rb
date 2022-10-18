class ApartmentTenantsController < ApplicationController
  def index
    @apartment = Apartment.find(params[:apartment_id])
    @tenants = @apartment.tenants  
    if params[:sort] == "true" 
      @tenants = @tenants.order(:tenant_name)
    elsif params[:search]
      @tenants = @tenants.where("income > ?", params[:search].to_i)
    end 
  end

  def new 
    @apartment = Apartment.find(params[:apartment_id])
  end

  def create 
    @apartment = Apartment.find(params[:apartment_id])
    tenant = Tenant.create!(apt_ten_params)
    redirect_to "/apartments/#{@apartment.id}/tenants"
  end
private 
  def apt_ten_params
    params.permit(:tenant_name, :income, :pets, :occupation, :rent_price, :apartment_id)
  end
end