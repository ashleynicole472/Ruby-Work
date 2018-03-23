Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  
  get 'welcome/home', to: 'welcome#home'
  
  get 'signup', to: 'users#new'
  
  resources :users, except: [:new]
  
end
