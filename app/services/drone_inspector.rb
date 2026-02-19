class DroneInspector
  def self.call(site_id: nil, drone_id: nil)
    # PHASE 14 stub - returns mock diagnostics for now
    {
      status: 'diagnostics_complete',
      site_id: site_id,
      drone_id: drone_id,
      findings: ['Wiring OK', 'Server rack temp normal'],
      timestamp: Time.current
    }
  end
end
