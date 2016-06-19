Rails.application.routes.draw do
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :products
  root :to => 'static#index'
  get '/catalog' => 'products#catalog'
  get '/services' => 'static#services'
  get '/contacts' => 'static#contacts'
  get '/admin' => 'products#index'


  if ActiveRecord::Base.connection.table_exists? 'products'
    Product.select('name').each do |product|
      get '/catalog/' + product.name.gsub("/", "_").gsub("\\", "_").gsub("(", "-+").gsub(")", "+-") => 'products#catalog'
    end
  end
end
