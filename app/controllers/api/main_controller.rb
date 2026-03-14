module Api
  class MainController < ApplicationController
    skip_before_action :verify_authenticity_token
    def health; render json: {status: 'healthy', app_id: 180694}; end
    def fleet; render json: [{id: "DJI-PHX-179", battery: 87, status: "scanning Phoenix DC21", app_id: 180694}]; end
    def inspect; render json: {id: params[:id], status: "inspection complete", app_id: 180694}; end
    def control; render json: {id: params[:id], status: "executed", app_id: 180694}; end
    def export; render json: {format: 'csv', count: 247, app_id: 180694}; end
    def sms; render json: {success: true, app_id: 180694}; end
  end
end
