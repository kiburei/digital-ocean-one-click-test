class AddHotelToFacility < ActiveRecord::Migration[5.0]
  def change
    add_reference :facilities, :hotel, foreign_key: true
  end
end
