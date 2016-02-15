class Customer::PartnersController < ApplicationController
  def index
    @partners = User.partner
  end
end
