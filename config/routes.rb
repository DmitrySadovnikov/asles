Rails.application.routes.draw do
  resources :products
  root 'static#index'
  get '/index' => 'static#index'
  get '/catalog' => 'products#catalog'
  get '/services' => 'static#services'
  get '/contacts' => 'static#contacts'
  get '/admin' => 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
