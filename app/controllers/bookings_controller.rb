class BookingsController < ApplicationController

  def create
    if user_signed_in?
      @booking = Booking.new(booking_params)
      @facility = Facility.find(booking_params[:facility_id])
      respond_to do |format|
        if @booking.save
          UserMailer.booking_email(@facility).deliver
          format.html { redirect_to @facility, notice: "Facility successfully booked" }
        else
          format.html { redirect_to @facility, notice: "An error occured" }
        end
      end
    else
      redirect_to new_user_session_path, notice: "Please sign in to make a booking"
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
