Rails.application.routes.draw do
  resources :projects
  
  devise_for :users
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes 
  
  resources :template_formats
  # resources :template_formats do 
  #  get :view_format 
  # end
  resources :domains
  get 'home/index'

  get '/save_layout_data/:id', to: 'curriculum_vitaes#save_layout_data', as: 'save_layout_data'
  get '/layouts', to: 'curriculum_vitaes#layout_index', as: 'layout_index'
  get '/show_layout_data/:id', to: 'curriculum_vitaes#show_layout_data', as: 'show_layout_data'
  delete 'layouts/:id' ,to: 'curriculum_vitaes#layout_destroy' , as: 'layout'       
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
