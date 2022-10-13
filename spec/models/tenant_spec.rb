require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it {should belong_to :apartment}

end
