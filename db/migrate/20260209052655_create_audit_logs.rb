class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.references :swap_ticket, null: false, foreign_key: true
      t.string :action, null: false
      t.datetime :timestamp, null: false
      t.json :metadata, null: false, default: {}
      t.timestamps
    end
  end
end
