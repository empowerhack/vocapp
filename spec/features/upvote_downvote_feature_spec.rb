require 'rails_helper'

feature 'Upvoting and downvoting' do
  before do
    sign_up
    add_calculus_term
    fill_in 'Search', with: 'calculus'
    select 'Maths', from: 'field_id'
    click_button 'Search'
    add_answer
  end

  scenario 'downvoting works' do
    click_button 'Downvote'
    expect(page).to have_content 'Downvotes: 1'
  end

  scenario 'upvoting works' do
    click_button 'Upvote'
    expect(page).to have_content 'Upvotes: 1'
  end

  scenario 'upvoting cancels downvoting' do
    click_button 'Downvote'
    click_button 'Upvote'
    expect(page).to have_content 'Downvotes: 0'
  end

  scenario 'downvoting cancels upvoting' do
    click_button 'Upvote'
    click_button 'Downvote'
    expect(page).to have_content 'Upvotes: 0'
  end
end
