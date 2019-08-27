class TravelersController < ApplicationController
  def index
    @travelers = Traveler.page(params[:page]).per(10)

    render("traveler_templates/index.html.erb")
  end

  def show
    @traveler = Traveler.find(params.fetch("id_to_display"))

    render("traveler_templates/show.html.erb")
  end
end
