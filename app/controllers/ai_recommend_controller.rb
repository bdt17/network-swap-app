class AiRecommendController < ApplicationController
  def show
    render json: {model: "Cisco 9300X", priority: "HIGH", cost: "$4500"}
  end
end
