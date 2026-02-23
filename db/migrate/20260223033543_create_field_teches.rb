class CreateFieldTeches < ActiveRecord::Migration[8.1]
  def change
    create_table :field_teches do |t|
      t.string :name
      t.string :api_token

      t.timestamps
    end
    add_index :field_teches, :api_token, unique: true
  end
end
