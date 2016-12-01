require 'rails_helper'

describe Answer, type: :model do
  it { is_expected.to belong_to :term }
  it { is_expected.to belong_to :user}
  it { is_expected.to have_many :upvotes }
  it { is_expected.to have_many :downvotes }
  it { is_expected.to have_many :flags }

  describe '#url_fixer' do
    it 'returns the url if it begins with http' do
      url_string = "http://google.com"
      answer = Answer.new

      expect(answer.url_fixer(url_string)).to eq url_string
    end

    it 'returns the given url if it begins with https' do
      url_string = "https://google.com"
      answer = Answer.new

      expect(answer.url_fixer(url_string)).to eq url_string
    end

    it 'returns the url with http:// at start if its missing' do
      url_string = "google.com"
      answer = Answer.new

      expect(answer.url_fixer(url_string)).to eq 'http://' + url_string
    end

    it 'returns nil if url is nil' do
      url_string = nil 
      answer = Answer.new

      expect(answer.url_fixer(url_string)).to eq nil 
    end
 
  end

 

end
