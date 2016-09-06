class UpvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = find_answer(params[:answer_id])
    if current_user.has_upvoted? answer
      notify_already_up_downvoted('upvote', params[:term_id])
    else
      create_upvote(answer)
      refresh_term_page(params[:term_id])
    end
  end

  def destroy
    answer = find_answer(params[:answer_id])
    upvote = find_upvote(answer, params[:id])
    if current_user.has_upvoted? answer
      upvote.destroy
      refresh_term_page(params[:term_id])
    end
  end

private
  def create_upvote(answer)
    answer.upvotes.create({user_id: current_user.id})
  end

  def find_upvote(answer, id)
    answer.upvotes.find(id)
  end
end
