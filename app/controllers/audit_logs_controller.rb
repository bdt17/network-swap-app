class AuditLogsController < ApplicationController
  def index
    render json: [{event: "Zero Trust audit", status: "pass", timestamp: Time.now}]
  end
end
