class TermsController < ApplicationController
  def index
    @terms = Term.all
  end

  def create
    @term = Term.new(term_params)
  end

  def show
    @term = Term.find(params[:id])
  end

  def update
    @term = Term.find(params[:id])
  end

  def destroy
    @term = Term.find(params[:id])
  end
end
