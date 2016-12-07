Rails.application.routes.draw do

  devise_for :users
  root 'shops#index'


  # Routes for the Photo resource:
  # CREATE
  get "/photos/new/:id", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  # Routes for the Shop resource:
  # CREATE
  get "/shops/new", :controller => "shops", :action => "new"
  post "/create_shop", :controller => "shops", :action => "create"

  # READ
  get "/shops", :controller => "shops", :action => "index"
  get "/shops/:id", :controller => "shops", :action => "show"

  # UPDATE
  get "/shops/:id/edit", :controller => "shops", :action => "edit"
  post "/update_shop/:id", :controller => "shops", :action => "update"

  # DELETE
  get "/delete_shop/:id", :controller => "shops", :action => "destroy"
  #------------------------------

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new/:id", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
