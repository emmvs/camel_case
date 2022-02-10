class AddCamelTypeToCamels < ActiveRecord::Migration[6.1]
  def change
    add_column :camels, :camel_type, :string
  end
end
