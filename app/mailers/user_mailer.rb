class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you_email(order)
    @order = order
    mail(to: @order.email, subject: "Thanks for your order! Order:#{@order.id}")
  end
end
