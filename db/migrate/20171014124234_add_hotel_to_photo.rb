class AddHotelToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :hotel, foreign_key: true
  end
end
