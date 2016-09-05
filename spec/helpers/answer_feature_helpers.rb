def add_answer
  visit ('/')
  fill_in 'term-search', with: 'calculus'
  select 'Maths', from: 'field_id'
  click_button 'Search'
  click_link 'More'
  fill_in 'answer_definition', with: 'fake definition'
  click_button 'Create Answer'
end

def add_second_answer_and_upvote
  visit '/'
  fill_in 'Search', with: 'calculus'
  select 'Maths', from: 'field_id'
  click_button 'Search'
  click_link 'More'
  fill_in 'answer_definition', with: 'second fake definition'
  click_button 'Create Answer'
  page.all(:button, "Upvote").last.click
end
