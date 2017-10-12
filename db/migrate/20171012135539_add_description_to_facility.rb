class AddDescriptionToFacility < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :description, :string
  end
end
