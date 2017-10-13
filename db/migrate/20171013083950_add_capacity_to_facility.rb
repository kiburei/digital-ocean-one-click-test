class AddCapacityToFacility < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :capacity, :string
  end
end
