Rails.application.routes.draw do
  # Routes for the Input resource:

  # CREATE
  get("/inputs/new", { :controller => "inputs", :action => "new_form" })
  post("/create_input", { :controller => "inputs", :action => "create_row" })

  # READ
  get("/inputs", { :controller => "inputs", :action => "index" })
  get("/inputs/:id_to_display", { :controller => "inputs", :action => "show" })

  # UPDATE
  get("/inputs/:prefill_with_id/edit", { :controller => "inputs", :action => "edit_form" })
  post("/update_input/:id_to_modify", { :controller => "inputs", :action => "update_row" })

  # DELETE
  get("/delete_input/:id_to_remove", { :controller => "inputs", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
