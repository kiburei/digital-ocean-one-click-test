class RegistrationsController < Devise::RegistrationsController
  before_action :set_hotel, only: [:show]

  def show
    @hotels = Hotel.all
    @facilities = @hotel.facilities
    @max = 0
    @bookings = []
    @facilities.each do |facility|
      if facility.bookings.any?
        facility.bookings.each { |booking| if booking.event_date > Date.today then @bookings.push(booking) end }
      end
      facility.capacity.split(" ").each do |cap|
        if cap.to_i > @max
          @max = cap.to_i
        end
      end
      @bookings
      @max
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def sign_up_params
    params.require(:hotel).permit(:email, :password, :encrypted_password, :name, :country, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone, :description, :logo, :longitude, :latitude, :area)
  end

  def account_update_params
    params.require(:hotel).permit(:email, :encrypted_password, :name, :country, :current_password, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone, :description, :logo, :longitude, :latitude, :area)
  end
end
