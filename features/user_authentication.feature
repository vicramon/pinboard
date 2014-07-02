Feature: User authentication

  Scenario: User signs in
    Given I am a user
    When I visit the sign in page
    And I submit my sign in info
    Then I should be on the boards index

  Scenario: User signs out
    Given I am signed in
    When I follow "Sign out"
    Then I should be on the home page
