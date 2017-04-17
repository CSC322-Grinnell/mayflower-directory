#Run these tests using: cucumber --require features features/admin.feature
Feature: create an administrative user

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people

Background: some users have been added to database

  Given the following users exist:
  | email              | encrypted_password  | password       | admin | name           |
  | admin@example.com  | pass12345           | pass12345      | true  | Administrator  |
  | jojo@this.com      | jojo12345           | jojo12345      | false | Jojo Nice      |
  | admin2@admin.com   | getin12345          | getin12345     | true  | Admin Two      |
  | laddy@school.edu   | laddybuck12345      | laddybuck12345 | false | Laddy Buck     |
  | baddie@gone.com    | baddie12345         | baddie12345    | false | Baddie User    |

Scenario: log in as admin takes you to users page
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  Then I should be on the users page
  
Scenario: logged in admin sees edit
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Edit"
  
Scenario: logged in admin sees add
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Add"
  
Scenario: logged in admin sees delete
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Delete"
    
Scenario: view users
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Administrator"
  Then I should see "Laddy Buck"
    
Scenario: create an admin user
  Given I am logged in as admin
  And I am on the users page
  And I follow "Add"
  Then I should be on the new user page
  When I fill in "user_name" with "Alice Walker"
  And I fill in "user_email" with "xxxxx@xxxxxx.com"
  And I fill in "user_password" with "cats12345"
  And I fill in "user_password_confirmation" with "cats12345"
  And I check "Admin"
  When I press "Save User"
  Then I should be on the users page
  Then I should see "Alice Walker"
  Then I should see "xxxxx@xxxxxx.com"
  Then I should see "Admin"
  
Scenario: admin creates a regular user
  Given I am logged in as admin
  And I am on the users page
  And I follow "Add"
  Then I should be on the new user page
  When I fill in "user_name" with "Other Person"
  And I fill in "user_email" with "me@mine.com"
  And I fill in "user_password" with "friend12345"
  And I fill in "user_password_confirmation" with "friend12345"
  When I press "Save User"
  Then I should be on the users page
  Then I should see "Other Person"
  Then I should see "me@mine.com"

Scenario: delete last admin attempt
 Given I am logged in as admin
 And I am on the users page
 And I remove admin
 And I confirm the popup
 Then I should see "Unable to delete the last admistrator."

Scenario: change admin info
 Given I am logged in as admin
 And I am on the edit user page for "Jojo Nice"
 When I fill in "user_name" with "Ojoj Mean"
 And I fill in "user_email" with "new@email.com"
 And I fill in "user_password" with "dogs12345"
 And I fill in "user_password_confirmation" with "dogs12345"
 And I press "Update User Info"
 Then I should be on the user details page for "Ojoj Mean"
 And I should see "Ojoj Mean"
 And I should see "new@email.com"
 
Scenario: change user password 
 Given I am logged in as admin
 And I am on the edit user page for "Admin Two"
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
 And I am on the edit user page for "Admin Two"
 When I fill in "user_name" with "Alice Walker"
 And I fill in "user_email" with "Example2@admin.com"
 And I fill in "user_password" with "dogs12345"
 And I fill in "user_password_confirmation" with "cats12345"
 And I press "Update User Info"
 Then I am on the edit user page for "Administrator"
 And I should see "Passwords aren't the same"
 
#Don't have DELETE step yet is it possible?
Scenario: Delete a user
  Given I am logged in as admin
  And I am on the users page
  And I delete "Baddie User"
  And I confirm the popup
  Then I am on the users page
  And I should not see "Baddie User"