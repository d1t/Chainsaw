class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  def pay
    @api = PayPal::SDK::AdaptivePayments.new
    @pay = @api.build_pay({
      :actionType => "PAY", #PAY
      :cancelUrl => "http://localhost:3000/samples/adaptive_payments/pay",
      :currencyCode => "GBP",
      :feesPayer => "PRIMARYRECEIVER",
      :ipnNotificationUrl => "http://localhost:3000/samples/adaptive_payments/ipn_notify",
      :receiverList => {
        :receiver => [
          {
            :amount => 2.0,
            :email => "info-facilitator@cubey.co",
            :primary => true
          },
          {
            :amount => 1.0,
            :email => "info-buyer-1@cubey.co",
          }
          ] },
      :returnUrl => "http://localhost:3000/samples/adaptive_payments/pay",
      :senderEmail => 'some@business.business'
      # :sender => {
      #   :accountId => 'user-4-1456240948'
      # }
      })
    @response = @api.pay(@pay)
  end
end