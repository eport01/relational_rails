require 'rails_helper'

RSpec.describe 'Apartments tenants index page' do 
  describe 'as a visitor' do 
    describe 'when I visit /apartments/:apartment_id/tenants' do 
      before :each do 
        @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, 
          city: "Saint Paul", state: "MN", pet_friendly: true
        )
        @tenant_1 = @apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        @tenant_2 = @apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
        @tenant_3 = @apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)

      end
      it 'I see each tenant in that apartment and their attributes' do 
        visit "/apartments/#{@apartment_1.id}/tenants"

        expect(page).to have_content(@tenant_1.tenant_name)
        expect(page).to have_content(@tenant_1.income)
        expect(page).to have_content(@tenant_2.tenant_name)
        expect(page).to have_content(@tenant_3.tenant_name)

      end
    end
  end
end