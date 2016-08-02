class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @fields = Term.all.map { |i|
      i.ac_field_en
    }.uniq
  end 
end
