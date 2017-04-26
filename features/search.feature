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
 
 | first_name | last_name | nickname | email            | address      | neighborhood | spouse      |
 | Joseph     | Nice      | Jojo     | jojo@this.com    | 312 High St  | Nice One     | Baddie User |
 | Baddest    | User      | Baddie   | baddie@gone.com  | 312 High St  | Nice One     | Joseph Nice |
 | Lad        | Buck      | Laddy    | laddy@school.edu | 1202 East St | Bad one      | None        |

Scenario: search user by first name
  
Scenario: search user by last name
  
