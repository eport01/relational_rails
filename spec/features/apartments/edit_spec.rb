require 'rails_helper' 

RSpec.describe 'apartments edit page' do 
  describe 'as a visitor' do 
    describe 'edit form' do 
      it 'i see a form and can edit apartments attributes' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
        visit "/apartments/#{apartment_1.id}/edit"
        expect(page).to have_content("City")
      end 
    end

    describe 'when i click the link to update the apartment on its show page' do 
      before :each do 
        @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
        visit "/apartments/#{@apartment_1.id}/edit"
        fill_in :apt_name, with: 'Riverview'
        # choose 'wdyes' 
        fill_in :unit_count, with: 150
        fill_in :city, with: 'Saint Paul'
        fill_in :state, with: 'MN' 
        # choose 'petyes'
        click_button 'Edit Apartment'
      end
    
      it 'i can update apt info and click submit, i am taken back to the show page where the info is udpated' do 
        expect(current_path).to eq("/apartments/#{@apartment_1.id}")
      end 

      it 'i see the apartments updated info on the show page' do 
        visit "/apartments/#{@apartment_1.id}"
        expect(page).to have_content("Total Units: 150")
      end
    end
  end
end