def add_answer
  fill_in 'Search', with: 'calculus'
  select 'Maths', from: 'field_id'
  click_button 'Search'
  click_link 'More'
  fill_in 'answer_definition', with: 'fake definition'
  click_button 'Create Answer'
end
