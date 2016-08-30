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
      expect(page).to have_content "No results for 'calculus' Add a new term"
    end

    scenario 'user adds an answer' do
      fill_in 'Search', with: 'calculus'
      select 'Maths', from: 'field_id'
      click_button 'Search'
      add_answer
      expect(page).to have_content 'fakeemail@blah.com'
    end
  end
end
