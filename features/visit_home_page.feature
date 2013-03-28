Feature: Visit Home Page
  In order to become a volunteer tester
  As an unknown volunteer
  I have to be signed in

Scenario: Home Page
  Given I am an unknown volunteer
  When I go to the Home Page
  Then I should see "Are you a Beta Tester?"