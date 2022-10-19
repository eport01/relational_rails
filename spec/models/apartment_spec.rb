require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it {should have_many :tenants} 

  describe 'order by created at method' do 
    it 'returns the apartments ordered by created at date, desc' do 
      @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true, created_at: 30.seconds.ago)
      @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true, created_at: 90.seconds.ago)
      @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false, created_at: 60.seconds.ago)
      @apartments = [@apartment_1, @apartment_2, @apartment_3]
      expect(Apartment.order_by_created_at).to eq([@apartment_1, @apartment_3, @apartment_2])
      
    end
  end


end
