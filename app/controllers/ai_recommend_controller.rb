class AiRecommendController < ApplicationController
  def show
    render json: {recommendation: {model: "Cisco 9300X", priority: "high"}}
  end
end
