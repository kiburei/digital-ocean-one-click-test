class AddDateTimeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :event_date, :date
    add_column :bookings, :time_of_day, :string
  end
end
