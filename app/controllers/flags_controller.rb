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
    flag = answer.flags.find(params[:id])
    if current_user.has_flagged? answer || current_user.admin?
      flag.destroy
      redirect_to request.referrer
    end
  end

  def index
    @flags = Flag.all
  end
end
