require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :terms }
  it { is_expected.to have_many :answers }
  it { is_expected.to have_many :upvoted_answers }
  it { is_expected.to have_many :downvoted_answers }
  it { is_expected.to have_many :flagged_answers }

# haaaalp here
  # let!(:user) do
  #   User.create(email: 'iamauser@fakeemail.com',
  #               password: '12345678',
  #               password_confirmation: '12345678')
  # end
  #
  # describe '#has_upvoted?' do
  #   it 'should return true if the user upvoted an answer' do
  #     term = stub_model(Term, user: user)
  #     answer = stub_model(Answer, user: user, term: term)
  #     upvote = stub_model(Upvote, user: user, answer: answer)
  #     expect(user.has_upvoted?(answer)).to eq true
  #   end
  # end
end
