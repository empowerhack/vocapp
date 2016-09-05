class AnswersController < ApplicationController

  def create
    @term = Term.find(params[:term_id])
    @answer = @term.answers.new(answer_params)
    @answer.user_id = current_user.id
    @answer.save
    redirect_to "/terms/#{@term.id}"
  end

  def destroy
    answer = Answer.find(params[:id])
    if current_user.created_answer? answer || current_user.admin?
      answer.destroy
      redirect_to request.referrer
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:definition, :upvotes, :downvotes)
    end

end
