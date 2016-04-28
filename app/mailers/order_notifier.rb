class OrderNotifier < ActionMailer::Base
  default from: 'Cubey <info@cubey.co>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    
    mail to: order.email, subject: '<%= @partner.store.brand_name %> Order Confirmation'

  end


  def notify(partner, order)
    @partner = partner
    @order = order.partner

    mail to: partner.email, subject: 'Cubey - You have a new order'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: '<%= @partner.store.brand_name %> Order Shipped'
  end
end
