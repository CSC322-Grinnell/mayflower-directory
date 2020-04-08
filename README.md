--- Mayflower Directory Development Team ---


### Previous Groups

#### Spring 2017

* Kathryn Yetter
* Jong Hoon Bae
* Eli Solomon
* Harriet Zucker
* Shida Jing
* Ryan Galang

#### Fall 2017

* Addison Gould
* Joshua Tibatemwa
* Mariam Nadiradze
* Ankit Pandey
* Ana Segebre
* Mackenzie McFate

#### Spring 2018
* Faizaan Ali
* Rachel Swoap
* Sophie Gaschott
* Maisy Dodge
* Pat Min

#### Fall 2018
* Maisy Dodge
* Sam Stickels
* Nhi Ngo
* Cameron Chen
* Saung Thuya

#### Spring 2019
* Dennis Chan
* Lyn Dongze
* Tran Le
* John Lennon
* Zander Otavka

#### Spring 2020
* Names!
   
**Please contact a previous team member for links, passwords &/or invitations. (Trello, Slack, Heroku App)**
    
#### Setting Up Your Work Environment: 
    
You will each need to store the AWS keys locally - they cannot be left
out in the open to the public. At least one of you will need to
contact a previous team member or Sam and get the keys, probably via
onetimesecret. The rest of you can then copy those keys in person.
    
    
#### Deploying to Heroku:
Before you start, you need to make sure that you are authenticated into
Heroku. For setting up the CLI and credentials, you can refer to the
[official guide](https://devcenter.heroku.com/articles/heroku-cli).

After cloning the application, run
`heroku git:remote -a mayflowerdirectory-staging` in the root of the
project to add a `heroku` git remote. You can then deploy changes that
you have committed by pushing to the `heroku` remote with
`git push heroku master`. These changes will be available at the
`mayflowerdirectory-staging` Heroku app.

From the Heroku dashboard, under the `mayflower-directory` pipeline, you can then
deploy the changes you made from `mayflowerdirectory-staging` to
`mayflowerdirectory`. This is the app that is will be used by the
Mayflower residents, and so you should be careful in making sure all the
changes you made to the staging app work correctly.
    

## Create a private Workspace:
* Create a private workspace
* Choose the clone from Git or Mercurial URL option and enter the url of the Github repo
* Everyone should have an individual private workspace. Some things like account info and profiles will only exist on your personal workspace.

### NOTE: Cloud9 will soon be shut down, create local repositories with other services (AWS, Docker), or on your personal machine 

## In the Workspace:
* Run on terminal bundle install
* If bundle is not found, run, sudo gem uninstall bundler then gem install bundler
* Run on terminal figaro install 
* Into the config folder, edit file application.yml as follows:
* Put in the actual secret keys (contact Spring 2019 team)
*    AWS_ACCESS_KEY_ID: [access key id]
*    AWS_SECRET_ACCESS_KEY: [secret key]
*    AWS_BUCKET_NAME: mayflower-data 
*    AWS_DEFAULT_REGION: us-east-2
* Run in terminal rake db:migrate 
* Run in terminal rake db:seed
* The owner of the Heroku app (mayflower-directory@protonmail.com)has access to the secret keys (under settings -> reveal config vars). 
* Otherwise, get the password for the AWS account with this email, mayflower-directory@protonmail.com, and you can find the keys if you dig around a bit.

## To Preview The Application
* Run in terminal rails s -b $IP -p $PORT

## To Deploy the Application
* Log in to heroku from c9 terminal heroku login (or heroku login -i)
* Add the current app to your c9 heroku git:remote -a appname
* To migrate the database: heroku run rake db:migrate
* To deploy: git push heroku master

## AWS for Heroku:
* If AWS keys need to be updated on Heroku:
* Log in to heroku from c9 terminal with heroku login (or heroku login -i)
* Update ALL the secret keys (in c9 terminal) in the application.yml using this format for each:
* heroku config:set AWS_ACCESS_KEY_ID=[access key id]
* heroku config:set AWS_SECRET_ACCESS_KEY=[secret key]
* Etc.

## GIT:

### git checkout ‘branchname’
* You can checkout ANYONE’s branch, and everyone should have their own branch
* This is how you will review pull requests
* Make sure you are making edits on your own branch. Do not edit master directly.

### git pull
* Pulls updates to the branch you are on from github
* Pulling from master updates only master, pulling from a personal branch updates only that branch.

### git status 
* Shows you what files have been changed
* You can click on each file to add them individually
* Do not use ‘git add .’ or ‘git add -a’, as you may accidentally add a file that you did not mean to change. Only add the ones you know you changed.  

### git commit -m “commit message” 
* Commits changes to your local workspace
* Good commit messages will benefit you in the future by allowing you to see what you did in a given commit

### git push 
* Pushes changes from your personal branch to Github
* After pushing you must also create a pull request on Github
* To do this, go onto Github. If a suggestion for a new pull request does not appear, click ‘New Pull Request’ and make sure you are comparing your branch with master. 
* Request a reviewer. This will check out your branch to make sure your commits won’t break anything, and this person will merge the pull request if they approve of it. 
* Do not merge your own pull requests.

## To get up to date with master from Github:
* git pull master
* git checkout branchname
* git merge master
* If there are changes on your branch that are not committed, you will be asked to either commit your changes or stash them. 
* Sometimes there will be merge conflicts, and it’s sad but you can do it!
* When you commit and push your changes, you need to make a pull request before it goes to the master. This pull request should be reviewed by at least one other team member and merged by someone other than yourself. To make a pull request...
* Go to the repo on github
* Click on the Pull Requests tab
* Click New Pull Request
* Make sure you are comparing your branch to the master branch
* Make sure the files and changes that you committed are what you want to merge to master
* Click Create pull request
* Title your pull request something useful. If something breaks later and you need to search through commits to find where things got messed up, good titles will be helpful.
* On the right side under Reviewers, request some team members to review your pull request.
* Now wait until someone reviews it! If they think it is good and won’t break anything, they will merge it. Merging your own pull request is not good practice.
    
    
    
Below are some notes from previous team members:
    
## What We Learned

1. Read documentation all the way through before implementing gems - (Don't use a gem you don't understand)
2. Hartl is way more helpful than you think.
3. Use branches and forks/different workspaces.
4. Asking questions is much more efficient than googling the answer - (also sometimes all you need to do is restart)
5. Be POLITE to the clients and make sure to ask questions and TALK to them.
6. NEVER use `git add .`
7. Review each others' code to keep everyone on the same page (Github pull request reviews)
8. If there's a weird issue, try restarting the server
