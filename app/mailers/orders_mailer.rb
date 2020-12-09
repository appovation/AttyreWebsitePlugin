class OrdersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.orders_mailer.order_received.subject
  #
  def order_received(order)
    @order = order
    mail(to: ['mu.aijaz.khan@gmail.com', 'connect@appovation.co'], subject: 'New Order Received')
  end
end
