Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :bookmarks
  get "/signup",to: "users#new"
  resources :users, except: [:new]
  get "/new", to: "links#new"

end
