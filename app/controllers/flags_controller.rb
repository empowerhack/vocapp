class FlagsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    answer = find_answer(params[:answer_id])
    if current_user.has_flagged? answer
      flash[:notice] = 'You cannot flag more than once'
      refresh_term_page(params[:term_id])
    else
      answer.flags.create({user_id: current_user.id})
      refresh_term_page(params[:term_id])
    end
  end

  def destroy
    answer = find_answer(params[:answer_id])
    flag = answer.flags.find(params[:id])
    if current_user.has_flagged? answer or current_user.admin?
      flag.destroy
      refresh_term_page(params[:term_id])
    end
  end

  def index
    @flags = Flag.all
  end

  def index
    @fields = Field.all
    if field_selected?(params[:field_id])
      @flags = filtered_flags(params[:field_id])
    else
      @flags = Flag.all
    end
  end

  def filtered_flags(field_id)
    return Flag.includes(answer: :term).where(["terms.field_id = #{field_id}"]).references(:term)
  end
end
