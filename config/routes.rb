Rails.application.routes.draw do
  resources :materials
  resources :categories
  devise_for :users, :skip => [:sessions]

  resources :products
  root :to => 'static#index'
  get '/catalog' => 'products#catalog'
  get '/services' => 'static#services'
  get '/contacts' => 'static#contacts'
  get '/admin' => 'products#index'
end
