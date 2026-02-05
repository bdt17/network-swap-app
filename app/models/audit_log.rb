class AuditLog < ApplicationRecord
  belongs_to :user, optional: true
  validates :action, :resource_type, :resource_id, presence: true

  before_create :set_hash

  scope :recent, -> { order(created_at: :desc).limit(50) }

  private

  def set_hash
    self.hash_value = Digest::SHA256.hexdigest(
      "#{action}-#{resource_type}-#{resource_id}-#{Time.now.utc}"
    )
  end
end
