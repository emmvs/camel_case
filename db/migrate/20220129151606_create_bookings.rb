class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :state
      t.references :user, null: false, foreign_key: true
      t.references :camel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
