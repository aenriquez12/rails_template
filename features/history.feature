Feature: History Log

  As a user
  So that I can review my past IP lookups
  I want to see a history log of my searches

  Scenario: Viewing search history
    Given I have searched for IP addresses
    When I go to my history log
    Then I should see a list of my past searches
    And each entry should show the IP address and a timestamp

  Scenario: Configuring history duration
    Given I am on the history settings page
    When I set the tracker duration to "72 hours"
    And I save my settings
    Then my search history should be retained for "72 hours"

  Scenario: Automatic history log storage
    Given I have search activity older than "72 hours"
    When I check my history log
    Then older entries should be removed from the active tracker
    And they should be stored in archived history