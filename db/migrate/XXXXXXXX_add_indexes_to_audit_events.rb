class AddIndexesToAuditEvents < ActiveRecord::Migration[8.1]
  def change
    add_index :audit_events, :subject_type
    add_index :audit_events, :subject_id
    add_index :audit_events, :actor_type
    add_index :audit_events, :actor_id
  end
end
