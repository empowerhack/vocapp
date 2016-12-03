require 'rails_helper'

feature 'Answers' do
  context 'with normal user signed in' do
    scenario 'normal user cant add answer' do
      sign_up
      add_calculus_term
      visit('/')
      fill_in 'term-search', with: 'calculus'
      click_button 'Search'
      click_link 'More'
      expect(page).to_not have_content "Add a new answer"
    end

  end

  context 'with academic signed in' do
    before do
      sign_in_academic
    end

    context 'No answer added yet' do
      before do
        add_calculus_term
      end

      scenario 'should have no answer' do
        visit ('/')
        fill_in 'term-search', with: 'calculus'
        click_button 'Search'
        expect(page).to have_content "No answers for this term yet."
      end

      scenario 'user adds an answer' do
        add_answer
        expect(page).to have_content 'academic@vocapp.com'
      end


      scenario 'user adds an english definition' do
        add_answer
        expect(page).to have_content 'fake english definition'
      end


    end

    context "Ranking by scoring" do
      before do
        add_calculus_term
        add_answer
        add_second_answer_and_upvote
      end

      scenario 'see top scoring answer for terms with multiple answers' do
        visit ('/')
        fill_in 'term-search', with: 'calculus'
        select 'Maths', from: 'field_id'
        click_button 'Search'
        expect(page).to have_content 'second fake definition'
      end

      scenario 'top scoring answers are displayed first on term#show' do
        visit ('/')
        fill_in 'term-search', with: 'calculus'
        select 'Maths', from: 'field_id'
        click_button 'Search'
        click_link 'More'
        expect(page.all('.list-group-item').first).to have_content 'second fake definition'
      end
    end

    context 'adding urls' do

      before do
        add_calculus_term
        add_answer
      end

      scenario 'submitted urls appear' do
        visit ('/')
        fill_in 'term-search', with: 'calculus'
        select 'Maths', from: 'field_id'
        click_button 'Search'
        click_link 'More'
        expect(page).to have_content 'http://wikipedia.org/wiki/Calculus'
      end
    end
  end
end
