class CreateAuditRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_records do |t|
      t.string :event_type
      t.string :subject_type
      t.integer :subject_id
      t.string :actor_type
      t.integer :actor_id
      t.json :changes_json
      t.string :ip
      t.text :user_agent

      t.timestamps
    end
  end
end
