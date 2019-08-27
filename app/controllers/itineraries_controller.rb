class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all

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

  def edit_form
    @itinerary = Itinerary.find(params.fetch("prefill_with_id"))

    render("itinerary_templates/edit_form.html.erb")
  end

  def update_row
    @itinerary = Itinerary.find(params.fetch("id_to_modify"))

    @itinerary.traveler_id = params.fetch("traveler_id")
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

  def destroy_row
    @itinerary = Itinerary.find(params.fetch("id_to_remove"))

    @itinerary.destroy

    redirect_to("/itineraries", :notice => "Itinerary deleted successfully.")
  end
end