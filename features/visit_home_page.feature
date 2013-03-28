Feature: Visit Home Page
  In order to become a volunteer tester
  As an unknown volunteer
  I have to be signed in

#Background:
#  Given Mock Singly Serivce Github

Scenario: Connected with github
  Given I am an unknown volunteer
  When I go to the Home Page
  And I connect with Github
  Then I am at the application download page
  
Scenario: Unconnected with github
  Given I am an unknown volunteer
  When I go to the Home Page
  And I fail to connect with Github 
  Then I am on the Home Page
  
Scenario: Unconnected volunteer tries to visit applications page
  Given I am an unknown volunteer
  When I go to the Applications Page
  Then I am on the Home Page

Scenario: Connected with github disconects from DarkMoon
  Given I am a volunteer tester
  When I click on disconnect from Github
  Then I am on the Home Page
