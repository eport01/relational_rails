class TenantsController < ApplicationController
  def index 
    @tenants = Tenant.all 
    # require 'pry'; binding.pry
    @tenants = Tenant.where(pets: true)
  end

  # def create 
  #   tenant = Tenant.new({
  #     tenant_name: params[:tenant][:tenant_name],
  #     income: params[:tenant][:income],
  #     pets: params[:tenant][:pets],
  #     occupation: params[:tenant][:occupation],
  #     rent_price: params[:tenant][:rent_price]

  #   })

  #   tenant.save 

  #   redirect_to "/apartments/#{apartment.id}/tenants"

  # end

  def new 
    
  end

  def show 
    @tenant = Tenant.find(params[:id])
  end

  def edit 
    @tenant = Tenant.find(params[:id])

  end

  def update 
    tenant = Tenant.find(params[:id])
    tenant.update({
      tenant_name: params[:tenant_name],
      income: params[:income],
      pets: params[:pets],
      occupation: params[:occupation],
      rent_price: params[:rent_price]
    })
    tenant.save 
    redirect_to "/tenants/#{tenant.id}"

  end

  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    redirect_to '/tenants'
  end

end