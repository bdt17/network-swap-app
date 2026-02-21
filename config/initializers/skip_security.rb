# Skip host authorization for development
if Rails.env.development?
  Rails.application.config.hosts.clear
end
