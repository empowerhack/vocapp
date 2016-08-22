Rails.application.routes.draw do
  root 'application#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :terms do
    resources :answers do
      resources :upvotes
      resources :downvotes
      resources :flags
    end
  end
  get 'pages/help'
  get 'pages/about'
end
