Feature: Search

  Scenario: Searching for a term
    Given there's a search button
    When I type 'algorithm' into the search field and click search
    Then I should see the Terms page
    And I should see a table
    Then show me the page
    And in the first cell of the table I should see 'algorithm' and 'Information technology'
