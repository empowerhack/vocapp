class Term < ActiveRecord::Base
  belongs_to :field
  has_many :answers
end
