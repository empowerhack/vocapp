Given(/^there's a search button$/) do
  visit '/'
  expect(page).to have_button "Search"
end

When(/^I type 'algorithm' into the search field and click search$/) do
  fill_in :term_en, with: "algorithm"
  click_button("Search")
end

Then(/^I should see the algorithm search results$/) do
  url = URI.parse(current_url)
  expect("#{url.path}?#{url.query}").to include '/terms?term_en=algorithm'
end

Then(/^I should see a table$/) do
  expect(page).to have_table "terms_table"
end

Then(/^in the first cell of the table I should see 'algorithm' and 'Information technology'$/) do
  expect(page.first('//td').text).to include "algorithm"
  expect(page.first('//td').text).to include "Information technology"
end
