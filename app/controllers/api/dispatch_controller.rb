module Api
  class DispatchController < ApplicationController
    def index
      render json: [
        {
          id: 1,
          device: 'Cisco-2960-24TT',
          site: 'PHX-DC1', 
          tech: 'Smith,J. #2001',
          priority: 'critical',
          eta: '2hr',
          created_at: '2026-02-13T18:00:00Z'
        },
        {
          id: 2,
          device: 'Aruba-AP-305',
          site: 'DEN-DC1',
          tech: 'Garcia,M. #2005', 
          priority: 'high',
          eta: '4hr',
          created_at: '2026-02-13T17:30:00Z'
        },
        {
          id: 3,
          device: 'HP-LaserJet-Pro',
          site: 'PHX-DC1',
          tech: 'Unassigned',
          priority: 'medium',
          eta: '6hr',
          created_at: '2026-02-13T16:45:00Z'
        }
      ]
    end
  end
end
