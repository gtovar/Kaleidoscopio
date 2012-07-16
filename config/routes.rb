Kaleidoscopio::Application.routes.draw do  
  devise_for :admins
  resources :contacts 
  resources :courses do 
  resources :orders
  end	

	root :to => "home#index"
	match 'curso/:id' => 'home#show_detail_course_to_users', :as => 'curso' do
		resources :orders	
	end
	match '/admin' => 'courses#index', :as => 'admin'
	match '/acerca-de' => 'home#aboutus', :as => 'conocenos'
	match '/terminos-y-politicas' => 'home#terms', :as => 'terminos'
	match '/contacto' => 'contacts#new', :as => 'contacto'
	match '/quiero-dar-una-clase' => 'contacts#giveclass', :as => 'quieroclase', :via => :get
	match '/enviar-mensaje' => 'contacts#create_giveclass', :as => 'crear_quieroclase', :via => :post
	match '/privacidad' => 'static_pages#privacy', :as => 'privacidad'

	match '/contactos' => 'courses#index_contacts', :as => 'contactos'
	match '/ver-contacto/:id' => 'courses#show_contacts', :as => 'vercontacto'
	match '/dineromail' => 'dineromail#ipn', :as => 'dineromail'

	match '/lista-cursos' => 'home#listcoursespage', :as => 'listacursos'
	
	
	match '/get_next_results' => 'home#get_next_results'

	
	match '/success/:course_id' => 'orders#success', :as => 'course_success'
	match '/error' => 'home#error', :as => 'course_error'

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
  #root :to => 'courses#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
