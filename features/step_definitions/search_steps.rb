Given(/^there's a search button$/) do
  visit '/'
  expect(page).to have_button "Search"
end

When(/^I type 'algorithm' into the search field and click search$/) do
  fill_in "term_en", with: "algorithm"
  save_and_open_page
  click_button("Search")
end

Then(/^I should see the Terms page$/) do
  expect(current_path).to eq '/terms?term_en=algorithm'
end

Then(/^I should see a table$/) do
  expect(page).to have_table "terms_table"
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^in the first cell of the table I should see 'algorithm' and 'Information technology'$/) do
  byebug
  find('//table/tbody/tr/td')
end
