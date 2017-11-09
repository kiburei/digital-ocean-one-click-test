class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:user_bookings, :create]
  before_action :set_booking, only: [:reserve]

  def reserve
    # Set status of booked facility to true
    @booking.update(status: true)
    redirect_to hotel_path(current_hotel)
  end

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
    params.require(:booking).permit(:guests, :layout, :facility_id, :event_date, :time_of_day, :end, :notes)
  end

end
