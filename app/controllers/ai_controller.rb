class AiController < ApplicationController
  def recommend
    render json: { recommendation: "Replace EOL Cisco 2960", priority: "high" }
  end
end
