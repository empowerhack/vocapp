class UpvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = Answer.find(params[:answer_id])
    if current_user.has_upvoted? answer
      flash[:notice] = 'You cannot upvote more than once'
      redirect_to request.referrer
    else
      answer.upvotes.create({user_id: current_user.id})
      redirect_to request.referrer
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    upvote = answer.upvotes.find(params[:id])
    if current_user.has_upvoted? answer
      upvote.destroy
      redirect_to request.referrer
    end
  end
end
