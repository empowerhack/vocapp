class TermsController < ApplicationController

  def index
    @terms = Term.all
  end

  def new
    @term = Term.new(term_params)
  end

  def create
    @term = Term.new(term_params)
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
