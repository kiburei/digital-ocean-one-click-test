class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :facility_type

      t.timestamps
    end
  end
end
