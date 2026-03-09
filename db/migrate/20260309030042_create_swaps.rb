class CreateSwaps < ActiveRecord::Migration[8.1]
  def change
    create_table :swaps do |t|
      t.integer :device_id
      t.integer :tech_id
      t.string :status
      t.datetime :created_at

      t.timestamps
    end
  end
end
