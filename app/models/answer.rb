class Answer < ActiveRecord::Base
  belongs_to :term
  belongs_to :user

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :flags, dependent: :destroy

  validates :definition, presence: true

  def update_score
    update_attributes(score: (upvotes.count - downvotes.count))
  end
end
