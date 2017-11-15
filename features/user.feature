#Run these tests using: cucumber --require features features/user.feature
#Run the app using: rails s -b $IP -p $PORT
#A user is testing@testing.com PW is testme
Feature: login page capabilities

  As a user
  I want to be able to log in or sign up correctly
  So that I can access the database

Background: some users have been added to database

  Given the following users exist:
  | email              | encrypted_password  | password       | admin |
  | admin@example.com  | pass12345           | pass12345      | true  | 
  | jojo@this.com      | jojo12345           | jojo12345      | false |
  | snarky@sarcasm.com | snarks12345         | snarks12345    | false |
  | apple@xxx.com      | apple12345          | apple12345     | false |
  | laddy@school.edu   | laddybuck12345      | laddybuck12345 | false |

Scenario: attempt to access page when not logged in 
  Given I am not logged in
  And I am on the login page
  Then I should see "Email"
  And I should see "Password"
  And I should see "Remember me"

Scenario: login (happy path)
	Given I am on the login page
	And I fill in "Email" with "jojo@this.com"
	And I fill in "Password" with "jojo12345"
	And I press "Log in"
	Then I should be on the change password page
 	
Scenario: login without password
	Given I am on the login page
	And I fill in "Email" with "admin@example.com"
	And I press "Log in"
	Then I should see "Invalid Email or password"
 	
Scenario: login without email
	Given I am on the login page
	And I fill in "Password" with "pass12345"
	And I press "Log in"
	Then I should see "Invalid Email or password"
 	
Scenario: login with incorrect password
	Given I am on the login page
	And I fill in "Email" with "admin@example.com"
	And I fill in "Password" with "pass2222222"
	And I press "Log in"
	Then I should see "Invalid Email or password"
  
Scenario: Log out feature works
  Given I am logged in as user
  And I log out
  Then I am on the login page

Scenario: Logged in user can access about page
  Given I am on the login page
	And I fill in "Email" with "jojo@this.com"
	And I fill in "Password" with "jojo12345"
	And I press "Log in"
	Then I should be on the change password page
  When I follow "About"
  Then I should be on the about page
  
Scenario: Logged in user can access contact page
  Given I am on the login page
	And I fill in "Email" with "jojo@this.com"
	And I fill in "Password" with "jojo12345"
	And I press "Log in"
	Then I should be on the change password page
  When I follow "Contact"
  Then I should be on the help page