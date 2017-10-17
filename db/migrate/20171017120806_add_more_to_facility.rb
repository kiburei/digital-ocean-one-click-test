class AddMoreToFacility < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :internet, :string
    add_column :facilities, :parking, :boolean
    add_column :facilities, :accomodation, :boolean
    add_column :facilities, :swimming_pool, :boolean
    add_column :facilities, :pa_system, :boolean
    add_column :facilities, :bar, :boolean
  end
end
