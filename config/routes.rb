Bulletin::Application.routes.draw do
  # Root URL
  root "pages#landing"

  # Landing
  get '/landing', controller: 'pages', action: 'landing'

  # Routes for the Category resource:
  # CREATE
  get '/categories/new', controller: 'categories', action: 'new', as: 'new_category'
  post '/categories', controller: 'categories', action: 'create', as: 'categories'

  # READ
  get '/categories', controller: 'categories', action: 'index'
  get '/categories/:id', controller: 'categories', action: 'show', as: 'category'

  # UPDATE
  get '/categories/:id/edit', controller: 'categories', action: 'edit', as: 'edit_category'
  patch '/categories/:id', controller: 'categories', action: 'update'

  # DELETE
  delete '/categories/:id', controller: 'categories', action: 'destroy'
  #------------------------------

  # Routes for the Task resource:
  # CREATE
  get '/tasks/new', controller: 'tasks', action: 'new', as: 'new_task'
  post '/tasks', controller: 'tasks', action: 'create', as: 'tasks'

  # READ
  get '/tasks', controller: 'tasks', action: 'index'
  get '/tasks/:id', controller: 'tasks', action: 'show', as: 'task'

  # UPDATE
  get '/tasks/:id/edit', controller: 'tasks', action: 'edit', as: 'edit_task'
  patch '/tasks/:id', controller: 'tasks', action: 'update'

  # DELETE
  delete '/tasks/:id', controller: 'tasks', action: 'destroy'
  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get '/events/new', controller: 'events', action: 'new', as: 'new_event'
  post '/events', controller: 'events', action: 'create', as: 'events'

  # READ
  get '/events', controller: 'events', action: 'index'
  get '/events/:id', controller: 'events', action: 'show', as: 'event'

  # UPDATE
  get '/events/:id/edit', controller: 'events', action: 'edit', as: 'edit_event'
  patch '/events/:id', controller: 'events', action: 'update'

  # DELETE
  delete '/events/:id', controller: 'events', action: 'destroy'
  #------------------------------

  # Routes for the Account resource:
  # CREATE
  get '/accounts/new', controller: 'accounts', action: 'new', as: 'new_account'
  post '/accounts', controller: 'accounts', action: 'create', as: 'accounts'

  # READ
  get '/accounts', controller: 'accounts', action: 'index'
  get '/accounts/:id', controller: 'accounts', action: 'show', as: 'account'

  # UPDATE
  get '/accounts/:id/edit', controller: 'accounts', action: 'edit', as: 'edit_account'
  patch '/accounts/:id', controller: 'accounts', action: 'update'

  # DELETE
  delete '/accounts/:id', controller: 'accounts', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
