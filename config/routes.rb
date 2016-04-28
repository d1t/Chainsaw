Rails.application.routes.draw do

  devise_for :users
  get '/:username' => 'profile#show', as: :profile
  resources :cards, only: [:new, :create, :destroy]

  get '/:username/dashboard' => 'dashboard#show', as: :dashboard

  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
  get 'pages/about'
  get 'pages/faq'
  get 'pages/blog'
  get '/products/checkout'



  namespace :customer do
    resources :partners, only: [:index, :show]
    resource :cart, only: [:show]
  end

  root 'customer/partners#index'

end