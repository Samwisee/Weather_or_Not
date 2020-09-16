Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/rails/info/routes' => 'routes'
  get 'devise/registrations/after_signup'

  resources :users
  resources :freetimes

end
