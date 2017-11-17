class AddFacilityToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :facility, foreign_key: true
  end
end
