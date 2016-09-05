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
      fill_in 'term-search', with: 'calculus'
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

  context "Ranking by scoring" do
    before do
      add_calculus_term
      add_answer
      add_second_answer_and_upvote
    end

    scenario 'see top scoring answer for terms with multiple answers' do
      visit ('/')
      fill_in 'term-search', with: 'calculus'
      select 'Maths', from: 'field_id'
      click_button 'Search'
      expect(page).to have_content 'second fake definition'
    end

    scenario 'top scoring answers are displayed first on term#show' do
      visit ('/')
      fill_in 'term-search', with: 'calculus'
      select 'Maths', from: 'field_id'
      click_button 'Search'
      click_link 'More'
      expect(page.all('.list-group-item').first).to have_content 'second fake definition'
    end

  end
end
