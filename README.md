# Persist-it

A Sinatra based application for keeping your notes organized and safe.

## About

I am one of those people who actually loves taking notes. Unfortunately, I don't keep my notes very well organized. I have some study notes taken in Notepad in one folder. I have a few more in a Google Docs file. I have other notes that are important to me, about my kid's milestones, in a random Word Doc. I wanted a place where I could keep all my notes organized (grouped by topic) and safe (additionally backed up on a website). So, I built it. Welcome to my app, Persist-it!


## Installation

1. Fork the repository
2. Clone the files to your computer
3. Run `bundle install`
4. Run `rake db:migrate`
5. Run `shotgun` to start the server

## Enabling Sessions

To enable sessions, which is a record of the users actions between login and logout, and allow the code to work with your session password take the following steps:

1. Create a .env file in the root directory.
2. In .env add the following, replacing the string ABC123 with a secret word or string.

    SESSION_SECRET="ABC123"

    Commit .gitignore

Note: Since the .env file contains sensitive information, it is important that it is not tracked, committed or pushed to Github. 

## Persist-it is now ready to use, so get started on saving your notes!