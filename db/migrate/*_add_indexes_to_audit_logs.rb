class AddIndexesToAuditLogs < ActiveRecord::Migration[8.0]
  def change
    add_index :audit_logs, :subject_type
    add_index :audit_logs, :subject_id
    add_index :audit_logs, :actor_type
    add_index :audit_logs, :actor_id
  end
end
