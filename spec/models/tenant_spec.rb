require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it {should belong_to :apartment}
  describe 'sorting methods' do 
    before :each do 
      @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true, created_at: 30.seconds.ago)
      @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true, created_at: 90.seconds.ago)
      @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false, created_at: 60.seconds.ago)
      @apartments = [@apartment_1, @apartment_2, @apartment_3]
      @tenant_1 = @apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
      @tenant_2 = @apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
      @tenant_3 = @apartment_1.tenants.create!(tenant_name: "John McVie", income: 1500, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)
      @tenant_4 = @apartment_2.tenants.create!(tenant_name: "Louie", income: 500, pets: true, occupation: "dog", rent_price: 300, apartment_id: 2)
    
      it 'i can input a number and it will return only tenants with rent_price greater than that number' do 
        expect(@apartment_1.search_by_income(2000)).to eq([@tenant_1, @tenant_2])
      end

      it 'the tenants of an apartment can be sorted in alphabetical order by name' do 
        expect(@apartment_1.order_by_name).to eq([@tenant_3, @tenant_2, @tenant_1])
      end
    
    end



  end

end
