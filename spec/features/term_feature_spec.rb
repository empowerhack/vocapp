require 'rails_helper'

feature 'Terms' do
  before do
    sign_up
  end

  context 'No term added yet' do
    scenario 'should display a prompt to add a new term'do
      visit ('/')
      fill_in 'Search', with: 'algorithm'
      click_button 'Search'
      expect(page).to have_content "No results for 'algorithm'"
      expect(page).to have_link 'Add a new term'
    end
  end

  context 'term doesnt exists' do
    scenario 'shouldnt find term yet' do
      visit ('/')
      fill_in 'Search', with: 'calculus'
      click_button 'Search'
      expect(page).to have_content "No results for 'calculus' Add a new term"
    end
  end

  context 'term exists' do
    before do
      add_calculus_term
    end

    context 'adding terms' do
      scenario 'user will fill out a form, then be redirected' do
        expect(page).to have_content 'Your term "calculus" has been submitted.'
        expect(current_path).to eq ('/')
      end
    end

    scenario 'see term results when searching' do
      fill_in 'Search', with: 'calculus'
      select 'Maths', from: 'field_id'
      click_button 'Search'
      expect(page).to have_content 'No answers for this term yet.'
      expect(page).to have_link 'Add a new term with a different academic field'
    end
  end
end
