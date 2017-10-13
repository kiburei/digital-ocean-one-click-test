class RenameColumnFacilityType < ActiveRecord::Migration[5.0]
  def change
    rename_column :facilities, :facility_type, :facility_layouts
  end
end
