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


end
