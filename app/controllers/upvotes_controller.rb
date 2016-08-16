class UpvotesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @answer = Answer.find(params[:answer_id])
    if current_user.has_upvoted? @answer
      flash[:notice] = 'You cannot upvote more than once'
    else
      @answer.upvotes.create(upvote_params)
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    upvote = answer.upvotes.find(params[:id])
    if current_user.has_upvoted? answer
      upvote.destroy
    end
  end

private
  def upvote_params
    parameters[:user_id] = current_user.id
    parameters
  end
end
