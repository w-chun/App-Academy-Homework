class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://99cats.com/session/new'
    mail(to: user.username, subject: 'Welcome to the page filled with cats!')
  end
end
