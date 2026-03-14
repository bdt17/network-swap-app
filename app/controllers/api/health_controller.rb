class Api::HealthController < ActionController::Metal
  def index
    render plain: "OK", status: 200
  end
end
