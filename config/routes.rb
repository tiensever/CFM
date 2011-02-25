Movies::Application.routes.draw do
  get "drill_down/index"
  match 'drill_down/movie_filming_movie' => 'drill_down#movie_filming_movie', :as => 'movie_filming_movie'
  match 'drill_down/city_filming_movie' => 'drill_down#city_filming_movie', :as => 'city_filming_movie'
  match 'drill_down/place_filming_movie' => 'drill_down#place_filming_movie', :as => 'place_filming_movie'

  resources :places

  resources :cities do 
    member do
      get 'add_place'
    end
  end

  resources :movies do
    member do 
      get 'add_place'
    end
  end

  match '/movie/update_add_place/:id' => 'movies#update_add_place', :as => 'update_add_place_movie'
  match '/movie/update_add_new_place/:id' => 'movies#update_add_new_place', :as => 'update_add_new_place_movie'
  match '/city/update_add_new_place/:id' => 'cities#update_add_new_place', :as => 'update_add_new_place_city'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "movies#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
