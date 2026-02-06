class Api::AuditLogsController < ApplicationController
  def index
    render json: [{action: "swap", user: "admin", time: Time.now.iso8601}]
  end
end
