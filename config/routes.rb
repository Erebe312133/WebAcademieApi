Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User routes
  get '/user', to: 'users#index'
  post '/user/', to: 'users#create'
  get '/user/:id', to: 'users#show'
  put '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#destroy'

  get '/user/:id/skill', to: 'users#skill_list'
  get '/user/skill/:type', to: 'users#index_by_skill'
  get '/user/skill/:type/:note', to: 'users#index_by_skill_and_note'

  # Project routes
  get '/project', to: 'projects#index'
  post '/project/', to: 'projects#create'
  get '/project/:id', to: 'projects#show'
  put '/project/:id', to: 'projects#update'
  delete '/project/:id', to: 'projects#destroy'

  # Skill routes
  post '/skill/', to: 'skills#create'
  get '/skill/:id', to: 'skills#show'
  put '/skill/:id', to: 'skills#update'
  delete '/skill/:id', to: 'skills#destroy'

end
