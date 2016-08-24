class Term < ActiveRecord::Base
  validates :term_en, uniqueness: { scope: :field, message: '"%{value}" exists for this academic field already.' }
  belongs_to :user
  belongs_to :field
  has_many :answers
end
