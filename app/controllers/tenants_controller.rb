class TenantsController < ApplicationController
  def index 
    @tenants = Tenant.all 
    @tenants = Tenant.where(pets: true)
  end

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
    tenant.update(tenant_params)
    tenant.save 
    redirect_to "/tenants/#{tenant.id}"
  end

  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    redirect_to '/tenants'
  end
private 
  def tenant_params
    params.permit(:tenant_name, :income, :pets, :occupation, :rent_price)
  end

end