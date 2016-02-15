Rails.application.routes.draw do

  devise_for :users
  get 'profile/:username' => 'profile#show', as: :profile
  resources :cards, only: [:new, :create, :destroy]

  get 'dashboard/show'

  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
  resources :products
  get 'pages/about'
  get 'pages/faq'
  get 'pages/blog'

  namespace :customer do
    resources :partners, only: [:index, :show]
    resource :cart, only: [:show]
  end

  root 'customer/partners#index'

end