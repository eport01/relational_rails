require 'rails_helper'

RSpec.describe 'apartments index page', type: :feature do 
  describe 'as a visitor' do 
    describe 'When I visit "/apartments"' do 
      it 'I see the name of each apartment in the system' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", 
          has_wd: true, 
          unit_count: 100, 
          city: "Saint Paul", 
          state: "MN", 
          pet_friendly: true
        )
        apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", 
          has_wd: true, 
          unit_count: 50, 
          city: "Denver", 
          state: "CO", 
          pet_friendly: true
        )

        apartment_3 = Apartment.create!(apt_name: "The Walter", 
          has_wd: false, 
          unit_count: 35, 
          city: "Aurora", 
          state: "CO", 
          pet_friendly: false
        )
        visit '/apartments'
        expect(page).to have_content(apartment_1.apt_name)
        expect(page).to have_content(apartment_2.apt_name)
        expect(page).to have_content(apartment_3.apt_name)
        
      end



      # Then I see the parent with that id including the parent's attributes
      # (data from each column that is on the parent table)
    end

    describe 'When I visit /parents/:id' do 
      it 'I see the apartment with that id including the apartments attributes' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", 
          has_wd: true, 
          unit_count: 100, 
          city: "Saint Paul", 
          state: "MN", 
          pet_friendly: true
        )
        apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", 
          has_wd: true, 
          unit_count: 50, 
          city: "Denver", 
          state: "CO", 
          pet_friendly: true
        )

        visit "/apartments/#{apartment_1.id}"
        save_and_open_page
        expect(page).to have_content(apartment_1.apt_name)
        expect(page).to have_no_content(apartment_2.apt_name)
        expect(page).to have_content("Washer/Dryer In-Unit? #{apartment_1.has_wd}")
        expect(page).to have_content("Total Units: #{apartment_1.unit_count}")
        expect(page).to have_content("City: #{apartment_1.city}")
        expect(page).to have_content("State: #{apartment_1.state}")
        expect(page).to have_content("Pet Friendly? #{apartment_1.pet_friendly}")



      end
    end
  end

end