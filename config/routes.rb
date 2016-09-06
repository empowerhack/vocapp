module Constraint
  class Admin

    def matches?(request)
      warden(request).user.admin? rescue false
    end

    private

    def warden(request)
      request.env['warden']
    end
  end
end

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

  get '/flags', to: 'flags#index', constraints: Constraint::Admin.new

end
