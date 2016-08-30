def add_answer
  click_link 'More'
  fill_in 'answer_definition', with: 'fake definition'
  click_button 'Create Answer'
end
