Rails.application.routes.draw do
  # Routes for the Hiking_review resource:
  # CREATE
  get "/hiking_reviews/new", :controller => "hiking_reviews", :action => "new"
  post "/create_hiking_review", :controller => "hiking_reviews", :action => "create"

  # READ
  get "/hiking_reviews", :controller => "hiking_reviews", :action => "index"
  get "/hiking_reviews/:id", :controller => "hiking_reviews", :action => "show"

  # UPDATE
  get "/hiking_reviews/:id/edit", :controller => "hiking_reviews", :action => "edit"
  post "/update_hiking_review/:id", :controller => "hiking_reviews", :action => "update"

  # DELETE
  get "/delete_hiking_review/:id", :controller => "hiking_reviews", :action => "destroy"
  #------------------------------

  # Routes for the Hiking_trail resource:
  # CREATE
  get "/hiking_trails/new", :controller => "hiking_trails", :action => "new"
  post "/create_hiking_trail", :controller => "hiking_trails", :action => "create"

  # READ
  get "/hiking_trails", :controller => "hiking_trails", :action => "index"
  get "/hiking_trails/:id", :controller => "hiking_trails", :action => "show"

  # UPDATE
  get "/hiking_trails/:id/edit", :controller => "hiking_trails", :action => "edit"
  post "/update_hiking_trail/:id", :controller => "hiking_trails", :action => "update"

  # DELETE
  get "/delete_hiking_trail/:id", :controller => "hiking_trails", :action => "destroy"
  #------------------------------

  # Routes for the State resource:
  # CREATE
  get "/states/new", :controller => "states", :action => "new"
  post "/create_state", :controller => "states", :action => "create"

  # READ
  get "/states", :controller => "states", :action => "index"
  get "/states/:id", :controller => "states", :action => "show"

  # UPDATE
  get "/states/:id/edit", :controller => "states", :action => "edit"
  post "/update_state/:id", :controller => "states", :action => "update"

  # DELETE
  get "/delete_state/:id", :controller => "states", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
