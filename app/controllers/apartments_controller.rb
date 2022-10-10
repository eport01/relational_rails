class ApartmentsController < ApplicationController
  def index
    @apartments = ['Apartment 1', 'Apartment 2', 'Apartment 3']
  end
end