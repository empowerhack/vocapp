class Answer < ActiveRecord::Base
  belongs_to :term
  belongs_to :user

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
