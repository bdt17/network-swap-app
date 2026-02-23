class DashboardController < ApplicationController
  def index; redirect_to tech_path; end
  def tech; @time = Time.now.strftime("%Y-%m-%d %H:%M MST"); render layout: false; end
end
