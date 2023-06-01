Rails.application.routes.draw do
  resources :projects
  # resources :skills ,:candidates ,:profiles
  devise_for :users
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes ,:template_formats
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # post '/save_layout_data', to: 'cv_page#save_layout_data', as: 'save_layout_data'
  get '/save_layout_data/:id', to: 'curriculum_vitaes#save_layout_data', as: 'save_layout_data'
  get '/layouts', to: 'curriculum_vitaes#layout_index', as: 'layout_index'
  get '/show_layout_data/:id', to: 'curriculum_vitaes#show_layout_data', as: 'show_layout_data'

  delete 'layouts/:id' ,to: 'curriculum_vitaes#layout_destroy' , as: 'layout'       
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
