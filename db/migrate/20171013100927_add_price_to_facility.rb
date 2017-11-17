class AddPriceToFacility < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :price, :decimal, :precision => 11, :scale => 2
  end
end
