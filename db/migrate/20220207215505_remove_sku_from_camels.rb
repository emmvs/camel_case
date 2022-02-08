class RemoveSkuFromCamels < ActiveRecord::Migration[6.1]
  def change
    remove_column :camels, :sku, :string
    remove_column :bookings, :camel_sku, :string
  end
end
