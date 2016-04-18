class Card < ActiveRecord::Base
  attr_accessor :cvv2
  belongs_to :user

  validates :expire_year, :expire_month, :cvv2, :number, presence: true


  def generate_external_customer_id
    "user-#{user.id}-#{Time.now.to_i}"
  end

  def store_to_paypal
    c = PayPal::SDK::REST::CreditCard.new(
      number: number,
      expire_year: expire_year,
      expire_month: expire_month,
      type: 'visa',
      cvv2: cvv2,
      external_customer_id: generate_external_customer_id
    )
    if c.create
      assign_attributes( credit_card_id: c.id, external_customer_id: c.external_customer_id, number: c.number)
      save
    end
  end

  def delete_from_paypal
    api = PayPal::SDK::REST::API.new
    begin
      api.delete("v1/vault/credit-cards/#{credit_card_id}")
      destroy
    rescue Exception => e
      p '~'*90
      p e.inspect
      false
    end
  end

end