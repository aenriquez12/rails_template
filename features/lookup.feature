Feature: IP Lookup Service

  As a user
  So that I can get information about an IP address
  I want to look up an IP and see OSINT details

  Scenario: Viewing my own IP address
    Given I visit the homepage
    Then I should see my public IP address

  Scenario: Looking up an IP address
    Given I enter a valid IP address "8.8.8.8" in the search box
    When I submit the search
    Then I should see information about "8.8.8.8"
    And I should see a reputation report for "8.8.8.8"

  Scenario: Looking up an invalid IP address
    Given I enter an invalid IP address "999.999.999.999" in the search box
    When I submit the search
    Then I should see an error message "Invalid IP address"

  Scenario: Looking up a private/reserved IP address
    Given I enter a private IP address "192.168.1.1" in the search box
    When I submit the search
    Then I should see a message "Private IP addresses are not supported"