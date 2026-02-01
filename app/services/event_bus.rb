class EventBus
  def self.publish(event, payload = {})
    record = payload[:record]
    
    audit_data = {
      event: event,
      user_id: payload[:user]&.id,
      payload: payload.except(:record, :user)
    }
    
    audit_data[:auditable_type] = record&.class&.name if record
    audit_data[:auditable_id] = record&.id if record
    
    AuditLog.create!(audit_data)
  end
end
