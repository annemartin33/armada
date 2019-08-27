Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "trips#index"
  # Routes for the Expense resource:

  # CREATE
  get("/expenses/new", { :controller => "expenses", :action => "new_form" })
  post("/create_expense", { :controller => "expenses", :action => "create_row" })

  # READ
  get("/expenses", { :controller => "expenses", :action => "index" })
  get("/expenses/:id_to_display", { :controller => "expenses", :action => "show" })

  # UPDATE
  get("/expenses/:prefill_with_id/edit", { :controller => "expenses", :action => "edit_form" })
  post("/update_expense/:id_to_modify", { :controller => "expenses", :action => "update_row" })

  # DELETE
  get("/delete_expense/:id_to_remove", { :controller => "expenses", :action => "destroy_row" })

  #------------------------------

  # Routes for the Itinerary resource:

  # CREATE
  get("/itineraries/new", { :controller => "itineraries", :action => "new_form" })
  post("/create_itinerary", { :controller => "itineraries", :action => "create_row" })

  # READ
  get("/itineraries", { :controller => "itineraries", :action => "index" })
  get("/itineraries/:id_to_display", { :controller => "itineraries", :action => "show" })

  # UPDATE
  get("/itineraries/:prefill_with_id/edit", { :controller => "itineraries", :action => "edit_form" })
  post("/update_itinerary/:id_to_modify", { :controller => "itineraries", :action => "update_row" })

  # DELETE
  get("/delete_itinerary/:id_to_remove", { :controller => "itineraries", :action => "destroy_row" })

  #------------------------------

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
