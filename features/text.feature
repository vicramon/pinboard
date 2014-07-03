Feature: Text management

  Background:
    Given I am signed in
    And I have a board
    And I have text on my board
    And I visit my board

  Scenario: User edits text
    When I double click on that text
    And I modify the text
    And I click outside the text
    Then the text should be updated
    When I refresh the page
    Then the text should remain updated

  Scenario: User drags text to a new position
    When I drag my text to a new position
    Then the text should have the updated position

  @selenium
  Scenario: User deletes text
    When I click on my text
    And I press the backspace key
    Then my text should be deleted
