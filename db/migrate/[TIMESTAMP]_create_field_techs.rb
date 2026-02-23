class CreateFieldTechs < ActiveRecord::Migration[8.1]
  def change
    create_table :field_techs do |t|
      t.string :name
      t.string :api_token, null: false
      t.timestamps
    end
    add_index :field_techs, :api_token, unique: true
  end
end
