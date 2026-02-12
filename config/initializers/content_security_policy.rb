# DISABLE CSP for Dispatch Tower
Rails.application.config.content_security_policy %{
  default_src 'self' 'unsafe-inline' 'unsafe-eval';
  script_src   'self' 'unsafe-inline' 'unsafe-eval';
  style_src    'self' 'unsafe-inline';
  img_src      'self' data: https:;
}
