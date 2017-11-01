class UserMailer < ApplicationMailer

  def booking_email(facility)
    @facility = facility
    mail to: @facility.hotel.email, subject: "A booking has been made"
  end
end
