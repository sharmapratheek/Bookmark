Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :users, except: [:new]
  resources :bookmarks
  get "/signup",to: "users#new"


  get '/login',to: "sessions#new"
  post '/login',to: "sessions#create"
  delete '/login',to: "sessions#destroy"

end
