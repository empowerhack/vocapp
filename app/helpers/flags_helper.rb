module FlagsHelper
  def flag_params(params)
    params.require('flag').permit(:answer_id)
  end

  def find_answer(flag)
    return Answer.find(flag.answer_id)
  end
end
