require 'rails_helper'

feature 'Answers' do
  before do
    sign_up
  end

  context 'No answer added yet' do
    before do
      add_calculus_term
    end

    scenario 'should have no answer' do
      visit ('/')
      fill_in 'Search', with: 'calculus'
      click_button 'Search'
      expect(page).to have_content "No answers for this term yet."
    end

    scenario 'user adds an answer' do
      add_answer
      expect(page).to have_content 'fakeemail@blah.com'
    end

    scenario 'flagging' do
      add_answer
      click_button 'Flag'
      expect(page).to have_button 'Unflag'
    end
  end
end
