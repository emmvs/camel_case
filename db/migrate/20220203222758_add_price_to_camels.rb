class AddPriceToCamels < ActiveRecord::Migration[6.1]
  def change
    add_monetize :camels, :price, currency: { present: false }
  end
end
