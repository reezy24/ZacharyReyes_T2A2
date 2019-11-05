Rails.application.routes.draw do
  get 'projects/new'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :projects
end
