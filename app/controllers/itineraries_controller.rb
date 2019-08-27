class ItinerariesController < ApplicationController
  before_action :current_traveler_must_be_itinerary_traveler, :only => [:edit_form, :update_row, :destroy_row]

  def current_traveler_must_be_itinerary_traveler
    itinerary = Itinerary.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_traveler == itinerary.traveler
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Itinerary.ransack(params[:q])
    @itineraries = @q.result(:distinct => true).includes(:traveler, :trip, :trip_destination).page(params[:page]).per(10)

    render("itinerary_templates/index.html.erb")
  end

  def show
    @itinerary = Itinerary.find(params.fetch("id_to_display"))

    render("itinerary_templates/show.html.erb")
  end

  def new_form
    @itinerary = Itinerary.new

    render("itinerary_templates/new_form.html.erb")
  end

  def create_row
    @itinerary = Itinerary.new

    @itinerary.traveler_id = params.fetch("traveler_id")
    @itinerary.arrival_flight = params.fetch("arrival_flight")
    @itinerary.departure_flight = params.fetch("departure_flight")
    @itinerary.home_airport = params.fetch("home_airport")
    @itinerary.destination = params.fetch("destination")
    @itinerary.trip_id = params.fetch("trip_id")

    if @itinerary.valid?
      @itinerary.save

      redirect_back(:fallback_location => "/itineraries", :notice => "Itinerary created successfully.")
    else
      render("itinerary_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_trip
    @itinerary = Itinerary.new

    @itinerary.traveler_id = params.fetch("traveler_id")
    @itinerary.arrival_flight = params.fetch("arrival_flight")
    @itinerary.departure_flight = params.fetch("departure_flight")
    @itinerary.home_airport = params.fetch("home_airport")
    @itinerary.destination = params.fetch("destination")
    @itinerary.trip_id = params.fetch("trip_id")

    if @itinerary.valid?
      @itinerary.save

      redirect_to("/trips/#{@itinerary.trip_id}", notice: "Itinerary created successfully.")
    else
      render("itinerary_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @itinerary = Itinerary.find(params.fetch("prefill_with_id"))

    render("itinerary_templates/edit_form.html.erb")
  end

  def update_row
    @itinerary = Itinerary.find(params.fetch("id_to_modify"))

    
    @itinerary.arrival_flight = params.fetch("arrival_flight")
    @itinerary.departure_flight = params.fetch("departure_flight")
    @itinerary.home_airport = params.fetch("home_airport")
    @itinerary.destination = params.fetch("destination")
    @itinerary.trip_id = params.fetch("trip_id")

    if @itinerary.valid?
      @itinerary.save

      redirect_to("/itineraries/#{@itinerary.id}", :notice => "Itinerary updated successfully.")
    else
      render("itinerary_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_traveler
    @itinerary = Itinerary.find(params.fetch("id_to_remove"))

    @itinerary.destroy

    redirect_to("/travelers/#{@itinerary.traveler_id}", notice: "Itinerary deleted successfully.")
  end

  def destroy_row_from_trip
    @itinerary = Itinerary.find(params.fetch("id_to_remove"))

    @itinerary.destroy

    redirect_to("/trips/#{@itinerary.trip_id}", notice: "Itinerary deleted successfully.")
  end

  def destroy_row
    @itinerary = Itinerary.find(params.fetch("id_to_remove"))

    @itinerary.destroy

    redirect_to("/itineraries", :notice => "Itinerary deleted successfully.")
  end
end
