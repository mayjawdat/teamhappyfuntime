Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :edit]

  resources :appointments, except: [:destroy]

  root to: 'home#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
