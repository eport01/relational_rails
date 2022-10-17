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

      it 'I see a link to add a new tenant to this apartment' do 
        visit "/apartments/#{@apartment_1.id}/tenants"
        expect(page).to have_content('Create Tenant')
        click_link 'Create Tenant'
        # expect(current_path).to eq("/apartments/#{@apartment_1.id}/tenants")
      end

      it 'the tenants of an apartment can be sorted in alphabetical order by name' do 
        visit "/apartments/#{@apartment_1.id}/tenants"
        click_link("Sort Tenants Alphabetically")
        expect(@tenant_3.tenant_name).to appear_before(@tenant_2.tenant_name)
      end

      it 'there is a link to edit the tenants info and it leads me to that tenants edit page' do 
        visit "/apartments/#{@apartment_1.id}/tenants"
        click_on("Edit #{@tenant_1.tenant_name}'s Info")
        expect(current_path).to eq("/tenants/#{@tenant_1.id}/edit")

      end
      
      it 'i can click on a link to delete tenant and return to index page where tenant is not listed' do 
        visit "/apartments/#{@apartment_1.id}/tenants"
        expect(page).to have_content("#{@tenant_1.tenant_name}")
        click_button "Delete #{@tenant_1.tenant_name}"
        expect(current_path).to eq('/tenants')
        expect(page).to_not have_content("#{@tenant_1.tenant_name}")

      end

      it 'i can input a number and it will return only tenants with rent_price greater than that number' do 
        visit "/apartments/#{@apartment_1.id}/tenants"

      end




    end
  end
end