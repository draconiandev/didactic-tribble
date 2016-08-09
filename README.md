TrekHub
=====

[![Code Climate](https://codeclimate.com/github/draconiandev/didactic-tribble/badges/gpa.svg)](https://codeclimate.com/github/draconiandev/didactic-tribble)
[![Build Status](https://travis-ci.org/draconiandev/didactic-tribble.svg?branch=master)](https://travis-ci.org/draconiandev/didactic-tribble)
[![Test Coverage](https://codeclimate.com/github/draconiandev/didactic-tribble/badges/coverage.svg)](https://codeclimate.com/github/draconiandev/didactic-tribble/coverage)

As an online platform, Trekhub bridges the gap between customers and companies who organize adventure activities. We choose the right companies through fair competition, and make sure only the best of lot stay in business and flourish by helping them gain a larger customer base.

Roadmap
-------

As we're using TrekHub, we're constantly thinking of ways to improve it and there are a couple of features that we'd like to implement:
- Book an activity
- Sophisticated search engine with filters (We are now using pg_search)
- Better communication with the customers
- Let vendors create activities independently
- Mobile Apps

System Dependencies
-------------------

- Ruby 2.3.1 (install with [rbenv](https://github.com/sstephenson/rbenv))
- Rubygems
- Bundler (`gem install bundler`)
- PostgreSQL
- qmake (`brew install qt`) or read extensive instructions [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)
- imagemagick

Getting Started
---------------

**[Installation Instructions](install.md)**

Guidelines
----------
- Pull requests are welcome! If you aren't able to contribute code please open an issue on Github.
- Write specs!
- Develop features on dedicated feature branches, feel free to open a PR while it's still WIP
- Please adhere to the [Thoughtbot ruby styleguide](https://github.com/thoughtbot/guides/tree/master/style#ruby)
- All code and commit messages should be in English
- Commit messages are written in the imperative with a short, descriptive title. Good => `Return a 204 when updating a question`, bad => `Changed http response` or `I updated the http response on the update action in the QuestionController because we're not showing any data there`. The first line should always be 50 characters or less and that it should be followed by a blank line.
- You can always reach us at info@trekhub.in

License
-------
The trekhub source code is released under the MIT license.

"TrekHub", "trekhub.in" and the trekhub logo are copyright TrekHub Adventures LLP and may not be used without permission.
