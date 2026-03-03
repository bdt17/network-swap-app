class CreateDroneMissions < ActiveRecord::Migration[8.1]
  def change
    create_table :drone_missions do |t|
      t.references :drone, null: false, foreign_key: true
      t.string :status
      t.string :video_url
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
