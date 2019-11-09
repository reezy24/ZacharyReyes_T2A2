Rails.application.routes.draw do
  get 'browse', to: 'browse#browse', as: 'browse'
  get 'my_dashboard/projects'
  get 'my_dashboard/offers'
  get 'my_dashboard/proposals'
  get 'my_dashboard/profile'
  devise_for :members, controllers: {registrations: 'members/registrations'}
  get 'projects/new'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :projects
  resources :members
  patch 'members', to: 'members#update', as: 'update_profile'
end
