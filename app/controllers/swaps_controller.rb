class SwapsController < ApplicationController
  def index
    @swaps = Swap.all
    render inline: "<h1>Swaps (#{@swaps.count})</h1>"
  end
  
  def new; end
  def create; redirect_to swaps_path; end
  def show; render plain: "Swap ##{params[:id]}"; end
  def status; render plain: "Swap #{params[:id]}: ACTIVE"; end
  def claim; render plain: "Swap #{params[:id]} claimed"; end
end
