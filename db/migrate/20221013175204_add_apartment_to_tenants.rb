class AddApartmentToTenants < ActiveRecord::Migration[5.2]
  def change
    add_reference :tenants, :apartment, foreign_key: true
  end
end
