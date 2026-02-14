class PagesController < ApplicationController
  def tech
    render plain: 'Thomas IT Tech Dashboard - Phoenix DC21', status: 200
  end
end
