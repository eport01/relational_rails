class Apartment < ApplicationRecord
  has_many :tenants, dependent: :destroy 

   

end