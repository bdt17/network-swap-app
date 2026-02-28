class AddIndexesToAuditRecords < ActiveRecord::Migration[8.1]
  def change
    add_index :audit_records, :subject_type
    add_index :audit_records, :subject_id
    add_index :audit_records, :actor_type
    add_index :audit_records, :actor_id
  end
end
