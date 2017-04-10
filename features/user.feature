#Run these tests using: cucumber --require features features/user.feature
Feature: create an administrative user

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people

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
 	And I fill in "Email" with "admin@example.com"
 	And I fill in "Password" with "pass12345"
 	And I press "Log in"
 	Then I should be on the search page
 	
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

#ADMIN TESTS BELOW NOT WORKING YET
Scenario: log in as admin
  Given I am logged in as admin
  Then I should see "Edit Data"
    
Scenario: view users
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Administrator"
  Then I should see "Laddy Buck"
    
Scenario: create an admin user
	Given I am logged in as admin
  And I am on the new user page
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "xxxxx@xxxxxx.com"
	And I fill in "user_password" with "cats12345"
	And I fill in "user_password_confirmation" with "cats12345"
	And I check "Admin"
	When I press "Save User"
	Then I should be on the users page
	Then I should see "Alice Walker"
  Then I should see "xxxxx@xxxxxx.com"



Scenario: delete last admin attempt
  Given I am logged in as admin
  And I am on the users page
  And I remove admin
  And I confirm the popup
  Then I should see "Unable to delete the last admistrator."


Scenario: change password
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs12345"
	And I fill in "user_password_confirmation" with "dogs12345"
	And I press "Update User Info"
	Then I should be on the user details page for "Alice Walker"
  And I should see "Alice Walker"
	And I should see "Example2@admin.com"

Scenario: Passwords not the same
	Given I am logged in as admin
	And I am on the edit user page for "Administrator"
	When I fill in "user_name" with "Alice Walker"
	And I fill in "user_email" with "Example2@admin.com"
	And I fill in "user_password" with "dogs12345"
	And I fill in "user_password_confirmation" with "cats12345"
	And I press "Update User Info"
	Then I am on the edit user page for "Administrator"
	And I should see "Passwords aren't the same"