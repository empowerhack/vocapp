class DownvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = Answer.find(params[:answer_id])
    if current_user.has_downvoted? answer
      flash[:notice] = 'You cannot downvote more than once'
      redirect_to request.referrer
    else
      answer.downvotes.create({user_id: current_user.id})
      redirect_to request.referrer
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    downvote = answer.downvotes.find(params[:id])
    if current_user.has_downvoted? answer
      downvote.destroy
      redirect_to request.referrer
    end
  end
end
