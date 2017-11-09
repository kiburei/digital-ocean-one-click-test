class RemoveStartFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :start
  end
end
