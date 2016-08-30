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

  context 'term exists' do
    before do
      Field.create(name: 'Maths', id: 1)
      Field.create(name: 'Blah', id: 2)
      add_algorithm_term
    end

    scenario 'see term results when searching' do
      visit ('/')
      fill_in 'Search', with: 'algorithm'
      click_button 'Search'
      expect(page).to have_content 'fake context'
      expect(page).to have_link 'Add a new term with a different academic field'
    end
  end

  context 'adding terms' do
    scenario 'user will fill out a form, then be redirected' do
      visit ('/')
      fill_in 'Search', with: 'algorithm'
      click_button 'Search'
      click_link 'Add a new term'
      fill_in 'term_term_en', with: 'algorithm'
      select 'Maths', from: 'select-field'
      click_button 'Create Term'
      expect(page).to have_content 'Your term "algorithm" has been submitted.'
      expect(current_path).to eq ('/')
    end
  end
end
