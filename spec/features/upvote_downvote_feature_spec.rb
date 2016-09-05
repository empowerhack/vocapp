require 'rails_helper'

feature 'Upvoting and downvoting' do
  before do
    sign_up
    add_calculus_term
    add_answer
  end

  scenario 'downvoting works'  do
    page.find(".downvote").click
    expect(page.find(".score")).to have_content '-1'
  end

  scenario 'upvoting works' do
    page.find(".upvote").click
    expect(page.find(".score")).to have_content '1'
  end

  scenario 'upvoting cancels downvoting' do
    page.find(".downvote").click
    page.find(".upvote").click
    expect(page.find(".score")).to have_content '0'
  end

  scenario 'downvoting cancels upvoting' do
    page.find(".upvote").click
    page.find(".downvote").click
    expect(page.find(".score")).to have_content '0'
  end
end
