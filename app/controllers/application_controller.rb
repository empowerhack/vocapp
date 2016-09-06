class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  after_filter :store_location

  def index
    @fields = Field.all
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def find_answer(answer_id)
    Answer.find(answer_id)
  end

  def notify_already_up_downvoted(string, term_id)
    flash[:notice] = "You cannot #{string} more than once"
    redirect_to request.referrer
  end

  def refresh_term_page(term_id)
    redirect_to "/terms/#{term_id}"
  end
end
