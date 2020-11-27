Rails.application.routes.draw do
  
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookmarks
  post '/categoria', to: 'categories#create', as: "create_category"
  get '/categories.json', to: 'categories#get_api', as: 'get_api'
  # resources :bookmarks do
  #   resources :types, only: [:show]
  # end
  # resources :types, except: [:show]
  root 'bookmarks#index'
end
