Feature: Sign Up

  This is an example of how to use role data to keep
  your scenario wording declarative (.i.e. not passing
  the data from the scenario)

  Scenario: Create a New User
    Given I am a new user
    When I sign up for an account
    Then I expect to be redirected to the login page