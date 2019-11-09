Rails.application.routes.draw do
  get 'project_dashboard/edit/:id', to: 'project_dashboard#edit', as: 'project_dashboard_edit'
  get 'project_dashboard/members/:id', to: 'project_dashboard#members', as: 'project_dashboard_members'
  get 'project_dashboard/requests/:id', to: 'project_dashboard#requests', as: 'project_dashboard_requests'
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
  resources :offers
  patch 'members', to: 'members/registrations#update', as: 'update_profile'
end
