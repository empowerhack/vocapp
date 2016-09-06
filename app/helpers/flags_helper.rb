module FlagsHelper
  def flag_params(params)
    params.require('flag').permit(:answer_id)
  end

  def find_answer_from_flag(flag)
    return find_answer(flag.answer_id)
  end
end
