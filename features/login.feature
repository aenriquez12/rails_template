Feature: User Login

  As a registered user
  So that I can access my lookup history
  I want to log into my account

  Scenario: Logging in with valid credentials
    Given I am on the login page
    When I enter my username "user@example.com"
    And I enter my password "securepassword"
    And I click the login button
    Then I should be redirected to my dashboard
    And I should see a welcome message "Welcome, user@example.com"

  Scenario: Logging in with incorrect credentials
    Given I am on the login page
    When I enter my username "user@example.com"
    And I enter my password "wrongpassword"
    And I click the login button
    Then I should see an error message "Invalid email or password"

  Scenario: Logging out
    Given I am logged in
    When I click the logout button
    Then I should be redirected to the homepage
    And I should see a message "You have been logged out"