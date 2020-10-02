Rails.application.routes.draw do
  get 'landingpage/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  
  get '/rails/info/routes' => 'routes'
  get 'devise/registrations/after_signup'

  resources :users
  resources :freetimes, only: [:new, :create]
  

  get '/send_mail_and_redirect', to: 'freetimes#send_mail_and_redirect'

  require "sidekiq/web"
  authenticate :user, ->(user) { user } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
