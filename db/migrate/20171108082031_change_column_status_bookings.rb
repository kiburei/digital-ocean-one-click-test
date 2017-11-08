class ChangeColumnStatusBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :status, :string, default: false
  end
end
