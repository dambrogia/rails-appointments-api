Rails.application.routes.draw do
  # For details on the DSL available within this file:
  # see http://guides.rubyonrails.org/routing.html
  resources :appointments do
  	resources :guests, except: :put
  end

  post 'auth/login', to: 'authentication#authenticate'

  resources :users
  post 'signup', to: 'users#create'
end
