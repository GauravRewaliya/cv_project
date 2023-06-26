Rails.application.routes.draw do
  resources :projects
  
  devise_for :users
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes 
  
  # resources :curriculum_vitaes do
  #   # get 'download', on: :member, format: :pdf
  #   get 'download', on: :member
  # end


  get 'pdf_html_req/:id' ,to:"curriculum_vitaes#pdf_html_req" , as: :pdf_html_req
  get 'docx_html_req/:id' ,to:"curriculum_vitaes#docx_html_req" , as: :docx_html_req


  resources :domains
  get 'home/index'

  root "home#index"
end
