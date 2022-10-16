require 'rails_helper' 

RSpec.describe 'apartments edit page' do 
  describe 'as a visitor' do 
    # before :each do 
    #   @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
    #   @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true)
    #   @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false)
    #   visit "/apartments/#{@apartment.id}/edit"
    #   fill_in 'apartment[apt_name]', with: 'Haunted House'
    #   choose 'wdno' 
    #   fill_in 'apartment[unit_count]', with: 200
    #   fill_in 'apartment[city]', with: 'Fear Town'
    #   fill_in 'apartment[state]', with: 'CA' 
    #   choose 'petyes'
    #   click_button 'Submit'
    # end

    describe 'edit form' do 
      it 'i see a form and can edit apartments attributes' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)

        visit "/apartments/#{apartment_1.id}/edit"

        expect(page).to have_content('Apartment Name:')
        expect(page).to have_content('Washer and Dryer In-Unit?')
        expect(page).to have_content('City:')
        expect(page).to have_content('State')
        expect(page).to have_content('Pet Friendly?')
      end 
    end

    describe 'when i click the link to update the apartment on its show page' do 
      before :each do 
        @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
        visit "/apartments/#{@apartment_1.id}/edit"
        fill_in 'apartment[apt_name]', with: 'Riverview'
        choose 'wdyes' 
        fill_in 'apartment[unit_count]', with: 150
        fill_in 'apartment[city]', with: 'Saint Paul'
        fill_in 'apartment[state]', with: 'MN' 
        choose 'petyes'
        click_button 'Submit'
      end
    

      it 'i can update apt info and click submit, i am taken back to the show page where the info is udpated' do 
        expect(current_path).to eq("/apartments/#{@apartment_1.id}")
      end 

      it 'i see the apartments updated info on the show page' do 
        visit "/apartments/#{@apartment_1.id}"
        # save_and_open_page

        expect(page).to have_content("Total Units: 150")
      end

    end
  end
end