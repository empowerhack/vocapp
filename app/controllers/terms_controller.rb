class TermsController < ApplicationController
  def index
    render json: Term.all
  end

  def create
    term = Term.new(term_params)
    render json:term if term.save
  end

  def show
    render json: Term.find(params[:id])
  end

  def update
    term = Term.find(params[:id])
    render json: term.update(term_params)
  end

  def destroy
    term = Term.find(params[:id])
    render json: term.destroy
  end
end
