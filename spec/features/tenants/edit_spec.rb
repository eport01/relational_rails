require 'rails_helper'

RSpec.describe 'tenants update page' do 
  describe 'as a visitor' do 
    before :each do 
      @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)

      @tenant_1 = @apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)

    end
    it 'when i click the link on show page it takes me to the edit page' do 
      visit "/tenants/#{@tenant_1.id}"
      expect(page).to have_content('2500')
      click_link 'Update this Tenant'
      expect(current_path).to eq("/tenants/#{@tenant_1.id}/edit")
    end

    it 'after i edit the attrubutes i click submit and i am redirected to tenant show page where i see new info' do 
      visit "/tenants/#{@tenant_1.id}/edit"
      fill_in :tenant_name, with: 'Stevie Nicks'
      fill_in :income, with: 100000
      select('true', from: :pets)     
      fill_in :occupation, with: 'singer'
      fill_in :rent_price, with: 2000
      click_button 'Update this Tenant'

      visit "/tenants/#{@tenant_1.id}"
      expect(page).to have_content('2000')
      expect(page).to_not have_content('2500')
    end
  end
end