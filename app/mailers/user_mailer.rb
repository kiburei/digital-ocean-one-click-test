class UserMailer < ApplicationMailer

  def booking_email(facility)
    @facility = facility
    @email = "akiburei@gmail.com"
    mail to: @email, subject: "A booking has been made"
  end
end
