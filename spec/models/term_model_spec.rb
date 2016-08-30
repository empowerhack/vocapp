require 'rails_helper'

describe Term, type: :model do
  it { is_expected.to have_many :answers }
  it { is_expected.to belong_to :user}

end
