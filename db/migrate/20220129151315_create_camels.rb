class CreateCamels < ActiveRecord::Migration[6.1]
  def change
    create_table :camels do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.integer :price
      t.string :city
      t.string :purpose
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
