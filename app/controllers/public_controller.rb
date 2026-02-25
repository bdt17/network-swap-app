class PublicController < ApplicationController
  def tech
    render plain: "Thomas IT Tech Dashboard - Field Ops Ready", status: :ok
  end
end
