class CreateSwaps < ActiveRecord::Migration[8.1]
  def change
    create_table :swaps do |t|
      t.references :device, null: false, foreign_key: true
      t.string :tech_name
      t.text :reason
      t.integer :status, default: 0
      # Single timestamps call only
      t.timestamps
    end
  end
end
