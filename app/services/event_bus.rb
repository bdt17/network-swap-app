class EventBus
  def self.publish(event, payload = {})
    record = payload[:record]
    
    AuditLog.create!(
      event: event,
      auditable_type: record.class.name if record,
      auditable_id: record.id if record,
      user_id: payload[:user]&.id,
      payload: payload.except(:record, :user)
    )
  end
end
