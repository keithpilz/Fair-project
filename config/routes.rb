Rails.application.routes.draw do

  get '/subscribe', to: 'users#new'
  post '/users', to: 'users#create'
end
