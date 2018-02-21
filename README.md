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


### Links from past teams: 

* [Spring 2017 Team's Waffle Page](https://waffle.io/baejongh/mayflower)
* Fall 2017 Team's Google Slides
	- https://docs.google.com/presentation/d/1KqmDjSqzYSs7QuO1QVgaVKArPO2P7_NTjr2TN88mWIM/edit#slide=id.p
	- https://docs.google.com/presentation/d/1qf7VvQlvfgZK39O7cuS5852ypNCjBLp9kQgYAGpRiI8/edit#slide=id.p
	- https://docs.google.com/presentation/d/1s0hZl9CJ3HiLw7Ek5VSHu1OCMrWThQ3EI0k_ayZQ9vk/edit#slide=id.p
   
**Please contact a Fall 2017 member for links, passwords &/or invitations. (Trello, Slack, Heroku App)**
    
#### Setting Up Your Work Environment: 
    
You will each need to store the AWS keys locally - they cannot be left
out in the open to the public. At least one of you will need to
contact a previous team member or Sam and get the keys, probably via
onetimesecret. The rest of you can then copy those keys in person.
    
    
#### Deploying to Heroku:
Before you start, you need to make sure that you are authenticated into
Heroku. For setting up the CLI and credentials, you can refer to the
[official guide](https://devcenter.heroku.com/articles/heroku-cli).
You'll also need to contact me at **\[pandeyan\]** to transfer ownership
of the applications and pipeline to you.

After cloning the application, run
`heroku git:remote -a mayflower-grinnell-staging` in the root of the
project to add a `heroku` git remote. You can then deploy changes that
you have committed by pushing to the `heroku` remote with
`git push heroku master`. These changes will be available at the
`mayflower-grinnell-staging` Heroku app.

From the Heroku dashboard, under the `mayflower` pipeline, you can then
deploy the changes you made from `mayflower-grinnell-staging` to
`mayflower-grinnell`. This is the app that is will be used by the
Mayflower residents, and so you should be careful in making sure all the
changes you made to the staging app work correctly.
    
    
    
    
Below are some notes from previous team members:
    
#### What We Learned

1. Read documentation all the way through before implementing gems - (Don't use a gem you don't understand)
2. Hartl is way more helpful than you think.
3. Use branches and forks/different workspaces.
4. Asking questions is much more efficient than googling the answer - (also sometimes all you need to do is restart)
5. Be POLITE to the clients and make sure to ask questions and TALK to them.
6. NEVER use `git add .`
    
    
#### To Do (Fall 2017)

1. Transer ownership of the repo to a new team member. (Contact [gouldadd@grinnell.edu])
2. Rename the repository.
3. Change the current group contact in help.html.erb.
4. Update the database with any new photos/info (last updated in Dec. 2017).
5. Finish Admin vs. User views.
6. We recommend adding a checkbox when an admin makes a new user to designate that user as another admin
7. Find a way for admin to delete users
8. Do a usability analysis // make it pretty. 
    - The font is too small in some places
    - add a drop down menu for neighborhoods instead of having them enter it as a string field
    - don't display results at the bottom of the search page
     
