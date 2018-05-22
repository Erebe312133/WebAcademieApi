Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User routes
  get '/user', to: 'user#index'
  post '/user/', to: 'user#create'
  get '/user/:id', to: 'user#show'
  put '/user/:id', to: 'user#update'
  delete '/user/:id', to: 'user#destroy'

end
