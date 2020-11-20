class OrdersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.orders_mailer.order_received.subject
  #
  def order_received(order)
    @order = order
    mail(to: 'aijaz-khan@hotmail.com', subject: 'Got a new Order')
  end
end
