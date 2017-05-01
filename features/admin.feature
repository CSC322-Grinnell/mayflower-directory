#Run these tests using: cucumber --require features features/admin.feature
Feature: create an administrative user

  As a sys admin.
  I want to be able to create an administrative user
  So that I can have specific people

Background: some users have been added to database

  Given the following users exist:
  | email              | encrypted_password  | password       | admin | 
  | admin@example.com  | pass12345           | pass12345      | true  | 
  | jojo@this.com      | jojo12345           | jojo12345      | false | 
  | admin2@admin.com   | getin12345          | getin12345     | true  | 
  | laddy@school.edu   | laddybuck12345      | laddybuck12345 | false | 
  | baddie@gone.com    | baddie12345         | baddie12345    | false | 

  
  Given the following profiles exist:
 
 | first_name | last_name | nickname | email            | address      | neighborhood | spouse      | landline | cell |
 | Joseph     | Nice      | Jojo     | jojo@this.com    | 312 High St  | Nice One     | Baddie User |          |      |
 | Baddest    | User      | Baddie   | baddie@gone.com  | 312 High St  | Nice One     | Joseph Nice |          |      |
 | Lad        | Buck      | Laddy    | laddy@school.edu | 1202 East St | Bad one      | None        |          |      |

Scenario: log in as admin takes you to users page
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  Then I should be on the users page
  
Scenario: regular user cannot see users page
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I should be on the search page 
  When I go to the users page
  Then I should see "Error"
  
Scenario: regular user cannot see edit, add or delete
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I should be on the search page 
  When I fill in "Email" with "laddy@school.edu"
  And I press "Search"
  Then I should not see "Edit"
  And I should not see "Add"
  And I should not see "Delete"
  
Scenario: logged in admin sees edit, add and delete
  Given I am logged in as admin
  And I am on the users page
  Then I should see "Edit"
  And I should see "Add"
  And I should see "Delete"
    
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

Scenario: Delete a user
  Given I am logged in as admin
  And I am on the users page
  And I delete "baddie@gone.com"
  And I confirm the popup
  Then I am on the users page
  And I should not see "baddie@gone.com"