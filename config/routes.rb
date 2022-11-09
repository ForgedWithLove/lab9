Rails.application.routes.draw do
  get 'friend/input'
  get 'friend/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root :to => "friend#input"
  # Defines the root path route ("/")
  # root "articles#index"
end
