require 'rails_helper'

RSpec.describe 'tenants show page', type: :feature do 
  describe 'as a visitor' do 
    describe 'when i visit /tenants/:id' do 
      before :each do 
        @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, 
          city: "Saint Paul", state: "MN", pet_friendly: true
        )
        @tenant_1 = @apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        @tenant_2 = @apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
        @tenant_3 = @apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)

      end
      it 'I see the tenant with that id including the tenants attributes' do 
        visit "/tenants/#{@tenant_1.id}"
        expect(page).to have_content(@tenant_1.tenant_name)
        expect(page).to have_content(@tenant_1.income)
        expect(page).to have_content(@tenant_1.pets)
        expect(page).to have_content(@tenant_1.occupation)
        expect(page).to have_content(@tenant_1.rent_price)
      end

      it 'i can click a link to delete tenant and am redirected to index page where i dont see this tenant' do 
        visit "/tenants/#{@tenant_1.id}"
        expect(page).to have_content(@tenant_1.tenant_name)
        click_button "Delete #{@tenant_1.tenant_name}"
        expect(current_path).to eq('/tenants')
        visit '/tenants'
        expect(page).to_not have_content("#{@tenant_1.tenant_name}")
      end
    end
  end
end