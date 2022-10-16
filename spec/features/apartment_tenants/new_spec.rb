require 'rails_helper'

RSpec.describe 'Apartment tenant creation' do 
  describe 'as a visitor' do 
    describe 'form to add a new tenant to an apartment' do 
      describe 'i fill in the form with the new tenants attributes' do 
        before :each do 
          @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
          visit "/apartments/#{@apartment_1.id}/tenants/new"
          fill_in :tenant_name, with: 'Steve Jobs'
          fill_in :income, with: 100000000
          # choose  :pets, with: true   
          fill_in :occupation, with: 'Computers'
          fill_in :rent_price, with: 8000
          click_button 'Create Tenant'
        end

        it 'i click button and am sent to that apartment tenants index page' do 
          expect(current_path).to eq("/apartments/#{@apartment_1.id}/tenants")
        end 
        it 'i can see the new tenant listed' do 
          expect(page).to have_content('Steve Jobs')
        end
      end
    end
  end
end