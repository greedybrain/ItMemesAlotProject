Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
     get '/users/:id', to: "users#show"
     resources :posts, except: [:index]
  end

  resources :posts, only: [:index]
  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
