class TermsController < ApplicationController
  include TermsHelper
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @searched_term = params[:term_en]
    if search_contains_characters(params)
      @terms =  unfiltered_results(params[:term_en])
    else
      @terms = Term.all.order(:term_en)
      @fields = Field.all
    end
    if params[:ac_field_en]
      @terms = filtered_results(params[:ac_field_en])
    end
  end

  def new
    @term = Term.new
    @fields = Field.all.map do |i|
      i
    end.uniq
  end

  def create
    @field = Field.find(term_params[:field_id])
    p term_params
    p @field
    @term = @field.terms.new(term_params)

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
