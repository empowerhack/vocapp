class Upvote < ActiveRecord::Base
  validates :user, uniqueness: { scope: :answer, message: "has upvoted this answer already" }
  belongs_to :user
  belongs_to :answer, counter_cache: true
end
