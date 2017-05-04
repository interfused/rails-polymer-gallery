Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  resources :mediafiles
#the get 'pagename' allows you to use things like pagename_path throughout the application
  get 'page2', to: 'welcome#page2'
  get 'page3', to: 'welcome#page3' 
  get 'welcome/index'


  resources :articles do
    resources :comments
  end

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users 
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
