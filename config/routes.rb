Rails.application.routes.draw do
  root "welcome#index"
  
  devise_for :users
  resources :users, only: [:show, :create, :destroy]

  resources :topics do 
    resources :bookmarks, except: [:index]
  end

  post :incoming, to: 'incoming#create'
end
