class Answer < ActiveRecord::Base
  belongs_to :term
  belongs_to :user

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :flags, dependent: :destroy

  def update_score
    update_attributes(score: (upvotes_count - downvotes.count))
  end
end
