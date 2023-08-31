Rails.application.routes.draw do
  devise_for :users
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :projects
  resources :tech_stacks ,:candidates ,:profiles
  resources :curriculum_vitaes 
  resources :domains

  post 'pdf_html_req/:id' ,to:"curriculum_vitaes#pdf_html_req" , as: :pdf_html_req
  post 'pdf_status/:id' ,to:"curriculum_vitaes#pdf_status"
  post 'pdf_download_req/:id' ,to:"curriculum_vitaes#pdf_download"
  post 'docx_html_req/:id' ,to:"curriculum_vitaes#docx_html_req" , as: :docx_html_req
  # get 'add_skill_popup' ,to:"curriculum_vitaes#add_skill" , as: :add_tech_stack_cv

  get 'projects/:proj_id/cv_project_details' , to: 'projects#cv_project_details'

  get 'home/index'
  root "home#index"
end
