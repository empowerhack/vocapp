class DownvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = find_answer(params[:answer_id])
    if current_user.has_downvoted? answer
      notify_already_up_downvoted('downvote', params[:term_id])
    else
      create_downvote(answer)
      redirect_to request.referrer
    end
  end

  def destroy
    answer = find_answer(params[:answer_id])
    downvote = find_downvote(answer, params[:id])
    if current_user.has_downvoted? answer
      downvote.destroy
      redirect_to request.referrer
    end
  end

private
  def create_downvote(answer)
    answer.downvotes.create({user_id: current_user.id})
  end

  def find_downvote(answer, id)
    answer.downvotes.find(id)
  end
end
