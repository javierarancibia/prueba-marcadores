Rails.application.routes.draw do
  resources :types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookmarks do
    resources :types, only: [:show]
  end
end
