class AddAreaToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :area, :string
  end
end
