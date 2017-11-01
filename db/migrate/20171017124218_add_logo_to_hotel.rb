class AddLogoToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :logo, :string
  end
end
