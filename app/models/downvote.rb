class Downvote < ActiveRecord::Base
  validates :user, uniqueness: { scope: :answer, message: "has downvoted this answer already" }
  belongs_to :user
  belongs_to :answer
end
