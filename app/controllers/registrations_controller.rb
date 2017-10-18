class RegistrationsController < Devise::RegistrationsController
  before_action :set_hotel, only: [:show]

  def show
    @facilities = @hotel.facilities
    @max = 0
    @facilities.each do |facility|
      facility.capacity.split(" ").each do |cap|
        if cap.to_i > @max
          @max = cap.to_i
        end
      end
      @max
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def sign_up_params
    params.require(:hotel).permit(:email, :password, :encrypted_password, :name, :country, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone, :description, :logo)
  end

  def account_update_params
    params.require(:hotel).permit(:email, :encrypted_password, :name, :country, :current_password, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone, :description, :logo)
  end
end
