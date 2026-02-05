class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.string :action
      t.references :user, null: false, foreign_key: true
      t.string :resource_type
      t.integer :resource_id
      t.string :hash_value

      t.timestamps
    end
  end
end
