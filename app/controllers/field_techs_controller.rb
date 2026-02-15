class FieldTechsController < ApplicationController
  def index
    @field_techs = FieldTech.all
  end
end
