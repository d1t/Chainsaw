Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get '/:username' => 'profile#show', as: 'custom_user'
    get '/:username/edit' => 'devise/registrations#edit', as: 'custom_edit_user'
  end

  get 'dashboard/show'
  root 'temp_home#show'

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

end