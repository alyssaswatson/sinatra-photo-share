This is a basic photo sharing app. Run 'bundle install' to install all gems. Run 'shotgun' to start your local server and copy past your server location into your browser.
You may create an account, view photos, and post photos to the feed. To post a photo, get a direct link to a photo (http://imageshack.us/discover is a great resource) and fill in a caption.
If you wish to edit a photo, click on the caption which is a link to the edit form. You may also delete a phtoto from this page.

These is the basic file structure of the app:
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── photo_controller.rb
│   │   └── user_controller.rb
│   ├── models
│   │   ├── photo.rb
│   │   └── user.rb
│   └── views
│       ├── photos
│       │   ├── edit.erb
│       │   ├── new.erb
│       │   ├── photos.erb
│       │   └── show.erb
│       ├── users
│       │   ├── login.erb
│       │   └── new.erb
│       ├── index.erb
│       ├── layout.erb

Questions may be directed to alyssa.s.watson@gmail.com

Copyright (c) Alyssa Watson
