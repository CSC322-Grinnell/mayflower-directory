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

 | first_name | last_name | nickname | email            | address      | neighborhood | spouse      | cell       | landline   |
 | Joseph     | Nice      | Jojo     | jojo@this.com    | 312 High St  | Nice One     | Baddie User | 1112224324 | 9871232324 |
 | Baddest    | User      | Baddie   | baddie@gone.com  | 312 High St  | Nice One     | Joseph Nice | 1112224322 | 9871232324 |
 | Lad        | Buck      | Laddy    | laddy@school.edu | 1202 East St | Bad one      | None        | 6663336666 | 2223334444 |

Scenario: log in as admin can see create/edit
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  Then I should see "Create Users"
  And I should see "Edit Residents"

Scenario: regular user cannot create or edit users
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  Then I should not see "Create Users"
  And I should not see "Edit Residents"


Scenario: regular user cannot see edit, add or delete
  Given I am on the login page
  And I fill in "Email" with "jojo@this.com"
  And I fill in "Password" with "jojo12345"
  And I press "Log in"
  And I follow "All Residents"
  Then I should not see "edit"
  And I should not see "delete"

Scenario: logged in admin sees edit, add and delete
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  And I follow "Edit Residents"
  Then I should see "edit"
  And I should see "delete"

Scenario: view users as an admin
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  And I follow "Edit Residents"
  Then I should see "Joseph Nice"
  Then I should see "Baddie User"

Scenario: create a resident
  Given I am on the login page
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "pass12345"
  And I press "Log in"
  And I follow "Edit Residents"
  And I follow "Add new Resident"
  Then I should be on the new resident page
  When I fill in "First name" with "Alice"
  And I fill in "Last name" with "Walker"
  And I fill in "Nickname" with "Al"
  And I fill in "Email" with "xxxxx@xxxxxx.com"
  When I press "Save changes"
  And I am on the users page
  Then I should see "Alice Walker"
  Then I should see "xxxxx@xxxxxx.com"

# TODO: The "Create Users" page doesn't work at the moment

# Scenario: admin creates a regular user
#   Given I am on the login page
#   And I fill in "Email" with "admin@example.com"
#   And I fill in "Password" with "pass12345"
#   And I press "Log in"
#   And I follow "Create Users"
#   Then I should be on the new user page
#   When I fill in "Email" with "me@mine.com"
#   And I fill in "Password" with "friend12345"
#   And I fill in "Password confirmation" with "friend12345"
#   And I press "Sign up"
#   And I follow "Log out"
#   Then I should be on the login page
#   When I fill in "Email" with "me@mine.com"
#   And I fill in "Password" with "friend12345"
#   And I press "Log in"
#   Then I should be on the search page

# TODO: follow "edit" for "1" fails because the element cannot be found
#	Maybe the CSS needs to be updated

# Scenario: change resident name
#   Given I am on the login page
#   And I fill in "Email" with "admin@example.com"
#   And I fill in "Password" with "pass12345"
#   And I press "Log in"
#   And I follow "Edit Residents"
#   And I follow "edit" for "1"
#   And I am on the edit details page for Joseph Nice
#   When I fill in "First name" with "Mary"
#   And I press "Save changes"
#   When I follow "All Residents"
#   Then I should see "Mary Nice"

# TODO: doesn't work for the above reason
# Scenario: Delete a user
#   Given I am on the login page
#   And I fill in "Email" with "admin@example.com"
#   And I fill in "Password" with "pass12345"
#   And I press "Log in"
#   And I follow "Edit Residents"
#   And I follow "delete" for "1"
#   And I confirm the popup
#   And I am on the users page
#   Then I should not see "Joseph Nice"