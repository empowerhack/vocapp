class AnswersController < ApplicationController

  def create
    @term = Term.find(params[:term_id])
    @answer = @term.answers.create(answer_params)
    redirect_to "/terms/#{@term.id}"
  end

  private
    def answer_params
      params.require(:answer).permit(:definition, :upvotes, :downvotes)
    end

end
