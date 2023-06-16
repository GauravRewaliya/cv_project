Rails.application.routes.draw do
  resources :projects
  
  devise_for :users
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes 
  
  resources :domains
  get 'home/index'

  root "home#index"
end
