Feature: Login

  This feature contains examples of using a more generic approach to
  roles. The steps all use a Role assigned to the @user variable.

  Scenario: Successful Login
    Given I am "Dedric"
    When I login to Moolah
    Then I expect to see my User Account

  # Example of instantiating a Role in a hook. Also, use
  # the Site config to maintain the expected error message.
  @invalid_user
  Scenario: Invalid Credentials
    When I login to Moolah
    Then I expect to see the Login Error Message

  Scenario: Logout
    Given I am logged into Moolah as "Carey"
    When I log out
    Then I expect to see the Login Page