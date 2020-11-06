Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookmarks
  resources :types
  post '/type', to: 'types#create', as: "create_type"
  # resources :bookmarks do
  #   resources :types, only: [:show]
  # end
  # resources :types, except: [:show]
  root 'bookmarks#index'
end
