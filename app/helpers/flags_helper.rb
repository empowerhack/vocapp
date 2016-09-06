module FlagsHelper
  def flag_params(params)
    params.require('flag').permit(:answer_id)
  end

  def answer_for(flag)
    return Answer.find(flag.answer_id)
  end

  def term_for(answer)
    return Term.find(answer.term_id)
  end

  def field_for(term)
    return Field.find(term.field_id)
  end

  def user_email_for(item)
    return User.find(item.user_id).email
  end

end
