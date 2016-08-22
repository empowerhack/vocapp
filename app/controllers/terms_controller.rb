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
    if params[:field_id]
      @terms = filtered_results(params[:field_id])
    end
    @term_titles = get_unique(@terms)
  end

  def new
    @term = Term.new
    @term_name_from_index = params["term_en"]
    @fields = Field.all
  end

  def create
    @field = Field.find(term_params[:field_id])
    @term = @field.terms.new(term_params)
    @term.user_id = current_user.id
    if @term.save
      flash[:notice] = "Your term \"#{@term[:term_en]}\" has been submitted."
      redirect_to '/'
    else
      flash[:notice] = "Sorry, there was a problem submitting your new term."
      redirect_to '/terms/new'
    end
  end

  def show
    @term = Term.find(params[:id])
    @fields = Field.all
    @answers = Answer.where(term_id: @term.id)
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
