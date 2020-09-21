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

  resources :users do
    resources :freetimes
  end

  get '/send_mail_and_redirect', to: 'freetimes#send_mail_and_redirect'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :freetimes
  resources :users

end
