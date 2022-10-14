class TenantsController < ApplicationController
  def index 
    @tenants = Tenant.all 
  end

  def create 
    tenant = tenant.new({
      tenant_name: params[:tenant][:tenant_name],
      income: params[:tenant][:income],
      pets: params[:tenant][:pets],
      occupation: params[:tenant][:occupation],
      rent_price: params[:tenant][:rent_price]

    })

    tenant.save 

    redirect_to '/tenants'
  end

  def show 
    @tenant = Tenant.find(params[:id])
  end

end