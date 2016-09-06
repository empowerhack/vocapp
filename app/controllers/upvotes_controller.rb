class UpvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = find_answer(params[:answer_id])
    if current_user.has_upvoted? answer
      notify_already_up_downvoted('upvote', params[:term_id])
    else
      answer.upvotes.create({user_id: current_user.id})
      redirect_to "/terms/#{params[:term_id]}"
    end
  end

  def destroy
    answer = find_answer(params[:answer_id])
    upvote = answer.upvotes.find(params[:id])
    if current_user.has_upvoted? answer
      upvote.destroy
      redirect_to "/terms/#{params[:term_id]}"
    end
  end
end
