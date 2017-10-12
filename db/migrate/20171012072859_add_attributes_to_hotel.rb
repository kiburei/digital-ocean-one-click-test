class AddAttributesToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :name, :string
    add_column :hotels, :country, :string
    add_column :hotels, :city, :string
    add_column :hotels, :county, :string
    add_column :hotels, :star, :integer
    add_column :hotels, :type, :string
    add_column :hotels, :phone, :string
    add_column :hotels, :postal_code, :string
    add_column :hotels, :company_postal_code, :string
    add_column :hotels, :hotel_manager_first_name, :string
    add_column :hotels, :hotel_manager_last_name, :string
    add_column :hotels, :hotel_manager_phone, :string
  end
end
