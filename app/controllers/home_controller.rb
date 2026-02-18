class HomeController < ApplicationController
  def index
    render file: Rails.public_path.join('index.html'), layout: false, status: :ok
  end
end
