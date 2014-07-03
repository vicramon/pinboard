Feature: Image

  Background:
    Given I am signed in
    And I have a board
    And I have an image on my board
    And I visit my board

  Scenario: User drags image to a new position
    When I drag my image to a new position
    Then the image should have the updated position

  @selenium
  Scenario: User deletes image
    When I click on my image
    And I press the backspace key
    Then my image should be deleted
