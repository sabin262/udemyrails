Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home' #for home page
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :articles
  resources :users, except: [:new] 
end
