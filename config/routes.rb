Rails.application.routes.draw do
  root to: 'pages#home'
  resources :contacts

  get 'about', to: 'pages#about'
end
