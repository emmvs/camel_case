class RemovePriceFromCamels < ActiveRecord::Migration[6.1]
  def change
    remove_column :camels, :price, :integer
  end
end
