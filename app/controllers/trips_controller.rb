class TripsController < ApplicationController
  def index
    @q = Trip.ransack(params[:q])
    @trips = @q.result(:distinct => true).includes(:itineraries, :expenses, :participant_itineraries, :participants).page(params[:page]).per(10)

    render("trip_templates/index.html.erb")
  end

  def show
    @expense = Expense.new
    @itinerary = Itinerary.new
    @trip = Trip.find(params.fetch("id_to_display"))

    render("trip_templates/show.html.erb")
  end

  def new_form
    @trip = Trip.new

    render("trip_templates/new_form.html.erb")
  end

  def create_row
    @trip = Trip.new

    @trip.destination = params.fetch("destination")
    @trip.trip_name = params.fetch("trip_name")
    @trip.traveler_id = params.fetch("traveler_id")

    if @trip.valid?
      @trip.save

      redirect_back(:fallback_location => "/trips", :notice => "Trip created successfully.")
    else
      render("trip_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @trip = Trip.find(params.fetch("prefill_with_id"))

    render("trip_templates/edit_form.html.erb")
  end

  def update_row
    @trip = Trip.find(params.fetch("id_to_modify"))

    @trip.destination = params.fetch("destination")
    @trip.trip_name = params.fetch("trip_name")
    @trip.traveler_id = params.fetch("traveler_id")

    if @trip.valid?
      @trip.save

      redirect_to("/trips/#{@trip.id}", :notice => "Trip updated successfully.")
    else
      render("trip_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @trip = Trip.find(params.fetch("id_to_remove"))

    @trip.destroy

    redirect_to("/trips", :notice => "Trip deleted successfully.")
  end
end
