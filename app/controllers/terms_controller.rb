class TermsController < ApplicationController
  include TermsHelper
  before_action :authenticate_user!, :except => [:index, :show]

  def index
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

  def update
    @original_term = Term.find(params[:id])
    @updated_term = term.update(term_params)
  end

  def destroy
    @term = Term.find(params[:id])
  end
end
