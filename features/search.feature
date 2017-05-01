#Run these tests using: cucumber --require features features/search.feature
#Run the app using: rails s -b $IP -p $PORT
#A user is testing@testing.com PW is testme
Feature: search page capabilities

  As a user
  I want to be able search using different attributes
  So that I can find people using things I know about them

Background: some users have been added to database

  Given the following users exist:
  | email              | encrypted_password  | password       | admin |
  | admin@example.com  | pass12345           | pass12345      | true  | 
  | jojo@this.com      | jojo12345           | jojo12345      | false |
  | snarky@sarcasm.com | snarks12345         | snarks12345    | false |
  | apple@xxx.com      | apple12345          | apple12345     | false |
  | laddy@school.edu   | laddybuck12345      | laddybuck12345 | false |
 
   Given the following profiles exist:
 
 | first_name | last_name | nickname | email            | address      | neighborhood | spouse      | cell       | landline   |
 | Joseph     | Nice      | Jojo     | jojo@this.com    | 312 High St  | Nice One     | Baddie User | 1112224324 | 9871232324 |
 | Baddest    | User      | Baddie   | baddie@gone.com  | 312 High St  | Nice One     | Joseph Nice | 1112224322 | 9871232324 | 
 | Lad        | Buck      | Laddy    | laddy@school.edu | 1202 East St | Bad one      | None        | 6663336666 | 2223334444 |

Scenario: search user by first name
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "First name contains" with "Joseph"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by partial data
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "First name contains" with "Jos"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by last name
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Last name contains" with "Nice"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by nickname
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Nickname contains" with "Jojo"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by email
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Email contains" with "jojo@this.com"
  And I press "Search"
  Then I should see "Joseph Nice"

Scenario: search user by address
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  Given I am on the search page
  And I fill in "Address contains" with "312 High St"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by neighborhood
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Neighborhood contains" with "Nice One"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by spouse
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Spouse contains" with "Baddie User"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by cell
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Cell contains" with "1112224324"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: search user by landline
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Landline contains" with "9871232324"
  And I press "Search"
  Then I should see "Joseph Nice"
  
Scenario: Users with common data
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Landline contains" with "9871232324"
  And I press "Search"
  Then I should see "Joseph Nice"
  And I should see "Baddest User"
  
Scenario: Clicking on search result takes you to user page
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I am on the search page
  And I fill in "Landline contains" with "9871232324"
  And I press "Search"
  And I follow "Joseph Nice"
  Then I am on the user details page for Joseph Nice