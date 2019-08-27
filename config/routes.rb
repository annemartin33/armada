Rails.application.routes.draw do
  # Routes for the Trip resource:

  # CREATE
  get("/trips/new", { :controller => "trips", :action => "new_form" })
  post("/create_trip", { :controller => "trips", :action => "create_row" })

  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  get("/trips/:id_to_display", { :controller => "trips", :action => "show" })

  # UPDATE
  get("/trips/:prefill_with_id/edit", { :controller => "trips", :action => "edit_form" })
  post("/update_trip/:id_to_modify", { :controller => "trips", :action => "update_row" })

  # DELETE
  get("/delete_trip/:id_to_remove", { :controller => "trips", :action => "destroy_row" })

  #------------------------------

  devise_for :travelers
  # Routes for the Traveler resource:

  # READ
  get("/travelers", { :controller => "travelers", :action => "index" })
  get("/travelers/:id_to_display", { :controller => "travelers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
