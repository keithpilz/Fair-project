Rails.application.routes.draw do

  get '/subscribe', to: 'users#new'
  post '/users', to: 'users#create'

  get '/admin', to: 'users#admin_login'
  post '/admin', to: 'users#admin_authenticate'
  get '/admin/dashboard', to: 'emails#index'

  resources :emails, only: [:create, :edit, :update, :destroy]

  put '/admin/:id/publish', to: 'emails#publish', as: :publish

end
