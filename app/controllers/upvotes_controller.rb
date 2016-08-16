class UpvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = Answer.find(params[:answer_id])
    if current_user.has_upvoted? answer
      flash[:notice] = 'You cannot upvote more than once'
      redirect_to "/terms/#{params[:term_id]}"
    else
      answer.upvotes.create(user_id: :user_id)
      p params[:term_id]
      redirect_to "/terms/#{params[:term_id]}"
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    upvote = answer.upvotes.find(params[:id])
    if current_user.has_upvoted? answer
      upvote.destroy
    end
  end
end
