# Volunteer Tracker

#### Ruby application that tracks projects and volunteers. , 2/23/2018

#### By Kim Huynh

## Description

Ruby application that tracks a project and their volunteers. By viewing, adding, updating, and deleting.

## Setup/Installation Requirements

To clone this repository.
Open terminal
Run the following command in your terminal to clone on local machine.
$ git clone https://github.com/kihuynh/volunteer.git

* To load sql database
  - run postgres in terminal (unless you have it running automatically)
  - $ psql
  - enter the following into the terminal
    - # createdb [DATABASE NAME]
    - # psql [DATABASE_NAME] < database_backup.psql
    - # createdb -T [DATABASE NAME] [TEST DATABASE NAME]

#### Basic Functionality

- Ability to add project names, and will show up on project list.
- Click on project list
- Ability to view, add, update, and delete projects
- Ability to view and add volunteers to projects.

## Technologies Used

* Ruby
* Gems (pry, rspec, bundler, etc)
* Sinatra

### License

Copyright (c) 2018 **_Kimberly Huynh_**
This software is licensed under the MIT license.
