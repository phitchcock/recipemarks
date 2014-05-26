Rails.application.routes.draw do
  root "welcome#index"
  
  devise_for :users
  resources :users, only: [:show, :create]

  resources :topics do 
    resources :bookmarks, except: [:index]
  end
end
