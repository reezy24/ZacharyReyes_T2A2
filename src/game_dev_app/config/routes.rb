Rails.application.routes.draw do
  devise_for :members
  get 'projects/new'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :projects
  resources :members
end
