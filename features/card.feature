Feature: Card management

  Scenario: User drags in new card
    Given I am signed in
    And I have a board
    And I visit my board
    When I drag in a new card
    Then I should see my card
    When I refresh the page
    Then I should see my card
