Rails.application.routes.draw do
  root "welcome#index"
  #get 'tags/:tag', to: 'topics#index', as: :tag

  devise_for :users
  
  resources :users, only: [:show, :create, :destroy]


  resources :bookmarks


  resources :tags 
  
  post :incoming, to: 'incoming#create'
end
