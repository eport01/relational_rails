class Apartment < ApplicationRecord
  has_many :tenants, dependent: :destroy 

  # def order_by_created_at
  #   order(created_at: :desc)
  # end

end