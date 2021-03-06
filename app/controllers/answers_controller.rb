class AnswersController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @term = Term.find(params[:term_id])
    @answer = @term.answers.new(answer_params)
    @answer.user_id = current_user.id
    @answer.save
    redirect_to "/terms/#{@term.id}"
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @term = Term.find(@answer.term_id)
    if @answer.update(answer_params)
      redirect_to "/terms/#{@term.id}"
    else
      render 'edit'
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    if current_user.created_answer? answer or current_user.admin?
      answer.destroy
      redirect_to request.referrer
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:definition_en, :definition_ar, :upvotes, :downvotes, :term_ar_match, :context_en, :context_ar, :ref_url)
    end
end
