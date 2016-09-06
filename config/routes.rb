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

  class DidUserCreateAnswer

    def matches?(request)
      current_user_id = warden(request).user.id
      answer_user_id = Answer.find(request.params[:id]).user_id
      current_user_id == answer_user_id
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
  
  get '/terms/:term_id/answers/:id/edit' => 'answers#edit', as: 'edit_term_answer', constraints: Constraint::DidUserCreateAnswer.new
  resources :terms do
    resources :answers, except: :edit do
      resources :upvotes
      resources :downvotes
      resources :flags
    end
  end

  get 'pages/help'
  get 'pages/about'

  get '/flags', to: 'flags#index', constraints: Constraint::Admin.new

end
