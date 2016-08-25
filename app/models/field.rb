class Field < ActiveRecord::Base
  has_many :terms
  validates :name, presence: true
end
