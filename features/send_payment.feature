Feature: Send Payment

  This is an example of 2 users (Carey & Dedric) interacting
  within the same scenario

  Scenario: Successful Payment
    Given I am Carey
    When I receive a payment of "5.00" from Dedric
    And I view my Account Activity
    Then I expect to see the transaction

  # This example uses hooks to instantiate roles and
  # the 'as' method to dynamically switch between them.
  # The 'as' method gives you more flexibility in how
  # you word your steps.
  @dedric @carey
  Scenario: Another Successful Payment
    Given "Dedric" has sent a payment of "5.00" to "Carey"
    When the payee views his Account Activity
    Then he expects to see the transaction