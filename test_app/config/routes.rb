Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  
  get 'welcome/home', to: 'welcome#home'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new'
  # post to log in which is create, goes to sessions controller, create action
  post 'login', to: 'sessions#create'
  # delete to log out will go to sessions controller, destroy action
  delete 'logout', to: 'sessions#destroy'
  
end
