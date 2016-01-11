Rails.application.routes.draw do

<<<<<<< HEAD
  
  root 'temp_home#show'

  resources :orders
  resources :line_items
  resources :carts
  devise_scope :partner do
  devise_for :partners, except: [:show, :edit]
end


  devise_scope :partner do
  get '/:username' => 'profile#show', as: 'custom_user'
  get '/:username/edit' => 'devise/registrations#edit', as: 'custom_edit_user'
end


  resources :products do
    get :who_bought, on: :member
  end
  
=======

  root 'products#index'
  devise_for :partners

  get '/profile' => 'profile#show'

  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'
  get 'cart' => 'cart#index'

  resources :products
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff
  get 'pages/about'

  get 'pages/faq'

  get 'pages/blog'

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
