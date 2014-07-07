Feature: Card management

  Background:
    Given I am signed in
    And I have a board
    And I have a card on my board
    And I visit my board

  Scenario: User edits a card's text
    When I double click on that card
    And I modify the text on the card
    And I click outside the card
    Then the card should have the new text
    When I refresh the page
    Then the card should have the new text

  Scenario: User drags a card to a new position
    When I drag my card to a new position
    Then the card should have the updated position

  @selenium
  Scenario: User deletes a card
    When I click on my card
    And I press the backspace key
    Then my card should be deleted
