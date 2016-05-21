Rails.application.routes.draw do
  resources :products
  root :to => 'static#index'
  get '/catalog' => 'products#catalog'
  get '/services' => 'static#services'
  get '/contacts' => 'static#contacts'
  get '/admin' => 'products#index'

  Product.select('name').each do |product|
    get '/catalog/' + product.name => 'products#catalog'
  end
end
