class ApartmentTenantsController < ApplicationController
  def index
    @apartment = Apartment.find(params[:apartment_id])
    @tenants = @apartment.tenants  
    if params[:sort] == "true" 
      @tenants = @tenants.sort_by{|tenant| tenant.tenant_name}
    end 

  end

  def new 
    @apartment = Apartment.find(params[:apartment_id])
  end

  def create 
    @apartment = Apartment.find(params[:apartment_id])
    tenant = Tenant.create!({
      tenant_name: params[:tenant_name],
      income: params[:income],
      pets: params[:pets],
      occupation: params[:occupation],
      rent_price: params[:rent_price],
      apartment_id: params[:apartment_id]

    })

    redirect_to "/apartments/#{@apartment.id}/tenants"
  end
end