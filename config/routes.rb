Rails.application.routes.draw do
  resources :projects
  # resources :skills ,:candidates ,:profiles
  devise_for :users
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
