class Tenant < ApplicationRecord
  belongs_to :apartment

  def self.order_by_name
    order(:tenant_name)

  end

  def self.search_by_income(amount)
    where("income > ?", amount.to_i)

  end
end