Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'login#login'

  get '/' => 'login#login'
  get '/login' => 'login#login'
  post '/login' => 'login#select'

  get '/admins' => 'admins#admin'

# admin#:location
# admin#:class
# admin#:cohort
# admin#:student_id

  # admins opt-in page for student search -or- admins listing
  # get '/admins/index' => 'admins#index'
  # destroy '/admins/index' => 'admins#destroy'
  # patch '/admins/index' => 'admins#update'

  # get '/admins/new' => 'admins#new'
  # post '/admins/new' => 'admins#create'

  get '/admins/search' => 'admins#search'
  # index of locations
  get '/admins/locations' => 'admins#locations'
  # show of a location
  get '/admins/:location' => 'admins#location'




  # get '/admins/search/cohorts' => 'cohorts#index'
  # get '/admins/search/cohorts/:cohort_id' => 'cohorts#show'

  # get '/admins/cohorts/:cohort_id/:student_id' => 'students#show'

  get '/students' => 'students#index'
  # get '/students/new' => 'students#create'
  get '/students/:student_id' => 'students#show'
  get '/students/:student_id/edit' => 'students#edit'
  post '/students/:student_id' => 'students#show'
  get '/students/:student_id/survey' => 'students#survey'

  resources :students






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
