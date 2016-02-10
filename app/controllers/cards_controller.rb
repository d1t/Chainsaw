class CardsController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]

  def new
    @card = current_user.cards.build
  end

  def create
    @card = current_user.cards.build(card_params)
    @card.ip_address = request.remote_ip
    respond_to do |format|
      if @card.valid? && @card.store_to_paypal
        format.html { redirect_to edit_user_registration_path, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card = current_user.cards.find params[:id]
    if @card.delete_from_paypal 
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: "You've deleted your card." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: 'There was an error in deleting card.' }
        format.json { render json: { error: 'There was an error in deleting card.' } }
      end
    end
  end

  private

    def card_params
      params.require(:card).permit(:number, :expire_year, :expire_month, :cvv2)
    end
end
