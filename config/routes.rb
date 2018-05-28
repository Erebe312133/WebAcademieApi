Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User routes
  get '/user', to: 'user#index'
  post '/user/', to: 'user#create'
  get '/user/:id', to: 'user#show'
  put '/user/:id', to: 'user#update'
  delete '/user/:id', to: 'user#destroy'

  get '/user/:id/skill', to: 'user#skill_list'
  get '/user/skill/:type', to: 'user#index_by_skill'
  get '/user/skill/:type/:note', to: 'user#index_by_skill_and_note'

  # Project routes
  get '/project', to: 'project#index'
  post '/project/', to: 'project#create'
  get '/project/:id', to: 'project#show'
  put '/project/:id', to: 'project#update'
  delete '/project/:id', to: 'project#destroy'

  # Skill routes
  post '/skill/', to: 'skill#create'
  get '/skill/:id', to: 'skill#show'
  put '/skill/:id', to: 'skill#update'
  delete '/skill/:id', to: 'skill#destroy'

end
