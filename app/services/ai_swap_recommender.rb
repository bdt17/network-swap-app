class AISwapRecommender
  def self.recommend_swaps(device)
    return unless device.eol_date < 90.days.from_now
    
    {
      model: 'Cisco Catalyst 9300',
      vendor: 'Cisco',
      priority: 'high',
      cost: 2500,
      urgency: 'immediate'
    }
  end
end
