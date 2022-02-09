class AddPaymentIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :payment_id, :string
  end
end
