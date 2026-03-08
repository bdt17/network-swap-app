class Device < ApplicationRecord
end

  def health_score
    issues = 0
    issues += 1 if firmware_version.nil? || firmware_version < "1.2"
    issues += 1 if last_seen_at < 1.week.ago
    issues += 1 unless status == "active"
    (100 - (issues * 25)).clamp(0, 100)
  end

  def health_issues
    issues = []
    issues << "firmware_old" if firmware_version.nil? || firmware_version < "1.2"
    issues << "offline" if last_seen_at < 1.week.ago
    issues << "inactive" unless status == "active"
    issues
  end
