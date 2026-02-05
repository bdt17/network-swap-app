class ZeroTrustService
  def self.authorize(action, resource, user)
    # Production: OPA integration
    # Local: simple role check
    user&.role == 'admin' || false
  end
end
