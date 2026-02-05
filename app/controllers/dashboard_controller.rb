class DashboardController < ApplicationController
  def index
    render html: File.read("public/index.html"), layout: false
  end
end
