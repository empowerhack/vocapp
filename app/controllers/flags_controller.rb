class FlagsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = Answer.find(params[:answer_id])
    if current_user.has_flagged? answer
      flash[:notice] = 'You cannot flag more than once'
      redirect_to "/terms/#{params[:term_id]}"
    else
      answer.flags.create({user_id: current_user.id})
      redirect_to "/terms/#{params[:term_id]}"
    end
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    flag = Flag.find(params[:id])
    p current_user.admin?
    p current_user.has_flagged? answer
    if current_user.has_flagged? answer or current_user.admin?
      flag.destroy
    end
    redirect_to request.referrer
  end

  def index
    @flags = Flag.all
  end
end
