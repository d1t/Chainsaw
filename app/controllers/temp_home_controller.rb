class TempHomeController < ApplicationController
  def show
  	@partners = Partner.all
  end
end