class Flag < ActiveRecord::Base
  validates :user, uniqueness: { scope: :answer, message: "has flagged this answer already" }
  belongs_to :user
  belongs_to :answer
end
