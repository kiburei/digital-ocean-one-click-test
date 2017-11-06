class BookingsController < ApplicationController
  before_action :authenticate_user!

  def user_bookings
    @bookings = Booking.where("user_id =?", current_user)
  end

  def create
      @booking = Booking.new(booking_params)
      @booking.user_id = current_user.id
      @facility = Facility.find(booking_params[:facility_id])
      respond_to do |format|
        if @booking.save
          UserMailer.booking_email(@facility).deliver
          format.html { redirect_to @facility, notice: "Facility successfully booked" }
        else
          format.html { redirect_to @facility, notice: "An error occured" }
        end
      end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:guests, :layout, :facility_id)
  end

end
