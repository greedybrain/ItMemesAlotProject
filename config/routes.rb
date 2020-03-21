Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do 
     get '/users/:id', to: "users#show"
  end
  
  resources :users do 
    resources :posts
  end

  resources :posts, path: :meme_feed do 
    resources :comments
    resources :likes, except: [:destroy]
    resources :tags
  end

  resources :likes, only: [:destroy]

  get '/memes_on_fire', to: "posts#mofs"
  get '/tags/:tag', to: "posts#index"
  
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
