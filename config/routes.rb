Rails.application.routes.draw do
  root :to => "inputs#index"
  # Routes for the Note resource:

  # CREATE
  get("/notes/new", { :controller => "notes", :action => "new_form" })
  post("/create_note", { :controller => "notes", :action => "create_row" })

  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  get("/notes/:id_to_display", { :controller => "notes", :action => "show" })

  # UPDATE
  get("/notes/:prefill_with_id/edit", { :controller => "notes", :action => "edit_form" })
  post("/update_note/:id_to_modify", { :controller => "notes", :action => "update_row" })

  # DELETE
  get("/delete_note/:id_to_remove", { :controller => "notes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Status resource:

  # CREATE
  get("/statuses/new", { :controller => "statuses", :action => "new_form" })
  post("/create_status", { :controller => "statuses", :action => "create_row" })

  # READ
  get("/statuses", { :controller => "statuses", :action => "index" })
  get("/statuses/:id_to_display", { :controller => "statuses", :action => "show" })

  # UPDATE
  get("/statuses/:prefill_with_id/edit", { :controller => "statuses", :action => "edit_form" })
  post("/update_status/:id_to_modify", { :controller => "statuses", :action => "update_row" })

  # DELETE
  get("/delete_status/:id_to_remove", { :controller => "statuses", :action => "destroy_row" })

  #------------------------------

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
