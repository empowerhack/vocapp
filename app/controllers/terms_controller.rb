class TermsController < ApplicationController
  include TermsHelper
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @searched_term = params[:term_en]
    if search_contains_characters(params)
      @terms =  unfiltered_results(params[:term_en])
    else
      @terms = Term.all.order(:term_en)
    end
    if params[:ac_field_en]
      @terms = filtered_results(params[:ac_field_en])
    end
  end

  def new
    @term = Term.new(term_params)
  end

  def create
    @term = Term.new(term_params)
    @user = current_user
    @term = @user.term.new(term_params)
    if @term.save
      redirect_to term_path
    else
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
