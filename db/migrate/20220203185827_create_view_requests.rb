class CreateViewRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :view_requests do |t|

      t.timestamps
    end
  end
end
