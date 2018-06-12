# Raise your Heart

## Group members
- [Carlos Díaz](mailto:cdiaz1@miuandes.cl)
- [Andrés Howard](mailto:aihoward@miuandes.cl)

# Features implemented (Assignment 4)

- We implemented `omniauth` with Facebook. Out facebook application is not published due 
to legal reasons, therefore the test user has to be included by hand. Please have
this in consideration.

- Every action in the app already showed feedback, so we didn't have to do anything here.

- We included `redcarpet` gem to render markdown. We use a helper method in the 
`app/helpers/application_helper.rb` file called markdown to render project descriptions
into html.

-  We implemented the funding flow of Assignment 1.1 which includes a confirmation
via email. Before this we were able to fund without confirmation. This includes
funding with promises.

- We implemented a search bar that allows to search through project titles and descriptions.

- We implemented Autorization by hand using `devise`, so we didn't use the gem
`cancancan`.

## Features implemented _(old)_

- In the landing page we show three featured projects. From here 
the user can go to _Browse Projects_ where all projects are shown or
select one from the three featured.
- On the index of projects we show all projects with visible attribute
set to true.
- We have two static pages (About and Contact) that display information
and a contact form respectively.
- In the navigation bar we can select a category. This redirects us
to a page with all projects belongings to that category.
- If a user is logged in their name appears in the navigation bar, and 
it is a link to their profile. Some important things to consider:
   
   1. A user can only edit their own profile, not others.
   2. Admins can edit everybody's profile.
   3. Users and admins can access all users profiles. Unregistered users 
   can also do so.
   
- We keep history of all changes made to projects, to do so we have a second
table called _Project Datum_ that stores all data from a project. This way, 
every time a change is made to the project we create a new registry in 
_Project Datum_, keeping the old one safe. To keep updated the relationship
betweeen Project and Project Datum every time we make a change (creating a new
registry) we update the reference.
- Projects have a default _placeholder_ if none is specified. This is to keep
the look of the website consistent.
- Projects show in their respective pages a progress bar with the goal and current 
amount raised. 
- Users can register (Become a Member), for this we have a form and a corresponding
controller and model. This way, we store then in the database.
- In order to keep the footer at the end we use `javascript`. This ensures that is 
the window is resized the footer will always be at the bottom. 


# Rails README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
