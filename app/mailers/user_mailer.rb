class UserMailer < ApplicationMailer

  def booking_email(facility)
    @facility = facility
    mail to: @facility.hotel.email, subject: "A booking has been made"
  end

  def confirmation(booking)
    mail to: booking.user.email, subject: "Facility has been reserved"
  end

end
