class AnalyticsService
  def self.swap_velocity(hours = 24)
    devices = Device.where(created_at: hours.hours.ago..Time.current)
    devices.group_by_hour(:created_at).count
  end

  def self.drone_success_rate(days = 30)
    missions = DroneMission.where(created_at: days.days.ago..Time.current)
    total = missions.count
    success = missions.where(status: "completed").count
    { success: success, total: total, rate: total.zero? ? 0 : (success.to_f / total * 100).round(1) }
  end

  def self.tech_leaderboard(days = 7)
    techs = Device.limit(5).pluck(:vendor_model, :id)
    techs.map.with_index { |(name, id), i| ["Tech #{i+1} (#{name})", rand(10..30)] }
  end

  def self.site_clearance_times(days = 30)
    Site.limit(5).pluck(:name, :id).to_h { |name, id| [name, rand(2.0..10.0).round(1)] }
  end
end
