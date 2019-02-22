class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you_email(user)
    @user = user
    @url = 'http://example.com'
    mail(to: @user.email, subject: 'Thanks for your order!')
  end
end
