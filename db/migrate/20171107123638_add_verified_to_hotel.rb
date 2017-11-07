class AddVerifiedToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :verified, :boolean, default: false
  end
end
