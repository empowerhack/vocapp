class Downvote < ActiveRecord::Base
  validates :user, uniqueness: { scope: :answer, message: "has downvoted this answer already" }
  belongs_to :user
  belongs_to :answer, counter_cache: true

  after_create :update_answer_score
  after_destroy :update_answer_score

  protected
    def update_answer_score
      self.answer.update_score
    end
end
