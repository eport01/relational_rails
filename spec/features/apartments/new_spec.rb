require 'rails_helper'

RSpec.describe 'apartments new page', type: :feature do 
  describe 'as a visitor' do 
    describe 'when i visit /apartments/new' do 
      it 'i see a form to create a new record' do 
        visit '/apartments/new'
        expect(page).to have_content('Apt name')
        expect(page).to have_content('Has wd')
      end


      describe 'i can add an apartment with attributes and submit to /apartments' do 
        before :each do 
          @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
          @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true)
          @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false)
          visit '/apartments/new'

          fill_in :apt_name, with: 'Haunted House'
          select('true', from: :has_wd)  
          fill_in :unit_count, with: 180
          fill_in :city, with: 'Fear Town'
          fill_in :state, with: 'CA' 
          select('false', from: :pet_friendly)  
          click_button 'Create New Apartment'
        end

        it 'can enter a new record and hit submit' do 
          expect(current_path).to eq("/apartments")
        end

        it 'can be redirected to apartments page where the user can see the new record' do 
          visit '/apartments'
          expect(page).to have_content('Haunted House')
        end        
      end 
    end
  end
end