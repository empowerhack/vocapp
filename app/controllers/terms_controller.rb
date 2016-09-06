class TermsController < ApplicationController
  include TermsHelper
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @searched_term = params[:term_en]
    @fields = Field.all
    @answers = Answer.all
    if search_contains_characters(params)
      @terms =  unfiltered_results(params[:term_en])
    else
      @terms = Term.all.order(:term_en)
    end
    if field_selected?(params[:field_id])
      @terms = filtered_results(params[:field_id])
    end
    @term_titles = get_unique(@terms)
  end

  def new
    @term = Term.new
    @fields = Field.all
  end

  def create
    field = Field.find(term_params[:field_id])
    term = field.terms.new(term_params)
    term.user_id = current_user.id
    if term.save
      notify_and_redirect(term[:term_en])
    else
      alert_and_redirect(term)
    end
  end

  def show
    @term = Term.find(params[:id])
    @fields = Field.all
    @answers = Answer.where(term_id: @term.id).order('score desc, created_at')
  end

  def edit
    @term = Term.find(params[:id])
  end

  def update
    term = Term.find(params[:id])
    term.update(term_params)
    redirect_to term_path
  end

  def destroy
    @term = Term.find(params[:id])
  end
end
