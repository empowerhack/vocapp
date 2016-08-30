require 'rails_helper'

describe Answer, type: :model do
  it { is_expected.to belong_to :term }
  it { is_expected.to belong_to :user}
  it { is_expected.to have_many :upvotes }
  it { is_expected.to have_many :downvotes }
  it { is_expected.to have_many :flags }

end
