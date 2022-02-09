class AddStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :payment_information, :integer, default: 0
  end
end
