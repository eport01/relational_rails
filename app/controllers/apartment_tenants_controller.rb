class ApartmentTenantsController < ApplicationController
  def index 
    @apartment = Apartment.find(params[:id])
    @tenants = @apartment.tenants  
  end

  def new 
    
  end

  def create 
    tenant = Tenant.new({
      tenant_name: params[:tenant][:tenant_name],
      income: params[:tenant][:income],
      pets: params[:tenant][:pets],
      occupation: params[:tenant][:occupation],
      rent_price: params[:tenant][:rent_price]

    })

    tenant.save 

    redirect_to "/apartments/#{@apartment.id}/tenants"
  end



end