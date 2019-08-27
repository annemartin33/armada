Rails.application.routes.draw do
  devise_for :travelers
  # Routes for the Traveler resource:

  # READ
  get("/travelers", { :controller => "travelers", :action => "index" })
  get("/travelers/:id_to_display", { :controller => "travelers", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
