class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  def index
    @fields = Term.all.map do |i|
      i.ac_field_en
    end.uniq
  end
end
