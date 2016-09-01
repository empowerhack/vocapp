module AnswersHelper
  def find_term(answer)
    return Term.find(answer.term_id)
  end
end
