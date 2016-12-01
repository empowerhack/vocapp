class Answer < ActiveRecord::Base
  before_create :set_ref_url

  belongs_to :term
  belongs_to :user

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :flags, dependent: :destroy

  validates :definition, presence: true

  def update_score
    update_attributes(score: (upvotes.count - downvotes.count))
  end

  def set_ref_url
    self.ref_url = url_fixer(ref_url)
  end

  def url_fixer(url)
    return nil if url == nil
    return url if url[0..3] == 'http' || nil
    'http://' + url
  end
end
