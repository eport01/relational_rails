class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :apt_name
      t.boolean :has_wd
      t.integer :unit_count
      t.string :city
      t.string :state
      t.boolean :pet_friendly

      t.timestamps 
    end
  end
end
