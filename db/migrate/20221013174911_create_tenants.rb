class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :tenant_name
      t.integer :income
      t.boolean :pets
      t.string :occupation
      t.integer :rent_price

      t.timestamps
    end
  end
end
