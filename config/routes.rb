Rails.application.routes.draw do
  root 'application#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :terms
end
