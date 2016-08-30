def add_algorithm_term
  visit ('/')
  fill_in 'Search', with: 'algorithm'
  click_button 'Search'
  click_link 'Add a new term'
  fill_in 'term_term_en', with: 'algorithm'

  find('#select-field').find(:xpath, 'option[2]').select_option

  click_button 'Create Term'
end
