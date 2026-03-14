class ApiController < ApplicationController
  def health; head :ok; end
  def fleet; head :ok; end  
  def inspect; head :ok; end
  def control; head :ok; end
  def export; head :ok; end
  def sms; head :ok; end
end
