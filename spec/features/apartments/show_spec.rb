require 'rails_helper'

RSpec.describe 'apartments show page', type: :feature do 
  describe 'as a visitor' do
    before :each do 
      @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
      @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true)
      @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false)
      @tenant_1 = @apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
      @tenant_2 = @apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
      @tenant_3 = @apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)
    end
    describe 'when i visit /apartments/:id' do 
      it 'returns a count of the number of tenants associated with this apartment' do 
        visit "/apartments/#{@apartment_1.id}"
        expect(page).to have_content("Tenants: #{@apartment_1.tenants.length}")
        expect(page).to have_no_content("Tenants: #{@apartment_2.tenants.length}")

      end
    end

    describe 'When I visit /apartments/:id' do 
      it 'I see the apartment with that id including the apartments attributes' do 
        visit "/apartments/#{@apartment_1.id}"
        expect(page).to have_content(@apartment_1.apt_name)
        expect(page).to have_no_content(@apartment_2.apt_name)
        expect(page).to have_content("Washer/Dryer In-Unit? #{@apartment_1.has_wd}")
        expect(page).to have_content("Total Units: #{@apartment_1.unit_count}")
        expect(page).to have_content("City: #{@apartment_1.city}")
        expect(page).to have_content("State: #{@apartment_1.state}")
        expect(page).to have_content("Pet Friendly? #{@apartment_1.pet_friendly}")
      end
    end

  end
end