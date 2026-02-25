class PublicController < ApplicationController
  skip_before_action :require_login
  
  def index
    render layout: 'application', file: 'public/index.html'
  end
  
  def tech
    # Tech documentation landing page
    @page_title = "Thomas IT Network Swap - Tech"
    render layout: 'application'
  end
  
  def enterprise
    # Enterprise features overview
    @page_title = "Thomas IT Network Swap - Enterprise" 
    render layout: 'application'
  end
  
  def dispatch
    # Dispatch operations overview
    @page_title = "Thomas IT Network Swap - Dispatch"
    render layout: 'application'
  end
end
