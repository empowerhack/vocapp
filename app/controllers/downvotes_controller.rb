class DownvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = find_answer(params[:answer_id])
    if current_user.has_downvoted? answer
      notify_already_up_downvoted('downvote', params[:term_id])
    else
      answer.downvotes.create({user_id: current_user.id})
      redirect_to "/terms/#{params[:term_id]}"
    end
  end

  def destroy
    answer = find_answer(params[:answer_id])
    downvote = answer.downvotes.find(params[:id])
    if current_user.has_downvoted? answer
      downvote.destroy
      redirect_to "/terms/#{params[:term_id]}"
    end
  end
end
