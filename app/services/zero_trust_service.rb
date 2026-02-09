class ZeroTrustService
  def self.authorize(token, action, resource)
    payload = decode_jwt(token)
    policy_pass = role_policy(payload[:role], action, resource)
    
    # Log to Rails.logger instead of DB during auth
    Rails.logger.info "Zero Trust: #{payload[:role]} #{action} #{resource} = #{policy_pass}"
    
    raise "Zero Trust denied: #{action} #{resource}" unless policy_pass
    payload
  end
  
  private
  
  def self.decode_jwt(token)
    JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')[0].symbolize_keys
  end
  
  def self.role_policy(role, action, resource)
    case role
    when 'admin'    then true
    when 'tech'     then %w[read create].include?(action.to_s)
    when 'viewer'   then action.to_s == 'read'
    else false
    end
  end
end
