def add_calculus_term
  visit ('/')
  fill_in 'Search', with: 'algorithm'
  click_button 'Search'
  click_link 'Add a new term'
  fill_in 'term_term_en', with: 'calculus'
  select 'Maths', from: 'term_field_id'
  click_button 'Create Term'
end
