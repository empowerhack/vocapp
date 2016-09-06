require 'rails_helper'

feature 'Flags' do
  before do
    sign_up
    add_calculus_term
    add_answer
  end

  scenario 'when user flags they should then be able to unflag their flag' do
    click_button 'Flag'
    expect(page).to have_button 'Unflag'
  end

  scenario 'flags appear on the flag page' do
    click_button 'Flag'
    visit('/flags')
    expect(page).not_to have_content 'No flagged items'
    expect(page).to have_content 'All flagged items'
  end

  scenario 'flags not to appear on the flag page when no flags' do
    visit('/flags')
    expect(page).to have_content 'No flagged items'
  end
end
