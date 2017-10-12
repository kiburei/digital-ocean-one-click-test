class RegistrationsController < Devise::RegistrationsController
  
  private

  def sign_up_params
    params.require(:hotel).permit(:email, :password,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           :encrypted_password, :name, :country, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone)
  end

  def account_update_params
    params.require(:hotel).permit(:email, :encrypted_password, :name, :country, :current_password, :city, :county, :star, :type, :phone, :postal_code, :company_postal_code, :hotel_manager_first_name, :hotel_manager_last_name, :hotel_manager_phone)
  end
end
                                      