class PublicController < ApplicationController
  def index
    render layout: 'application', file: 'public/index.html'
  end
end
