Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :topics do 
    resources :bookmarks, except: [:index]
  end
end
