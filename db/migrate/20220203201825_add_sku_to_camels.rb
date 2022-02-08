class AddSkuToCamels < ActiveRecord::Migration[6.1]
  def change
    add_column :camels, :sku, :string
  end
end
