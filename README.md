# Sinatra galleria.


#### What it is
It's a simple photo alubm / galleria application you run on your server. It serves albums and photos from a folder to the interwebs as simply as it can.

It uses [photoswipe](http://www.photoswipe.com/) for displaying photos. Although I'm not married to that idea and I may well change my mind again a couple of times.


#### What it aint and doesn't do

* aint database backed.
* aint social.
* doesn't have an admin gui.
* doesn't have 'users'.
* can't upload images remotely.


## The deal.
#### Folder setup

The folder setup:

    - public         <- in the root of this project
      - photos       <- you create this. Ideally this is a link to dropbox or something.
        - album a    <- each folder is an album
          image1.jpg 
          image2.jpg
        - album b
          image3.jpg
          image4.jpg
        ignored_image
      - thumbs       <- these are the thumbnails. Link this folder to a temp area somewhere.


#### Running locally

Uses [RVM](http://rvm.io) and bundler. So,

     gem install bundler
     bundle

Before you can see anything you'll need to generate some thumbnails for your images. Use the rake-taks.

    rake thumb_gen

You can put this into a crontab and have it run every day or every couple of hours. It will try to make thumbnails of all image formats it recognizes. It is idempotent and you can kill it and restart it any time and it will continue from where it left off.



You run the app by going
    
    ruby galleria.app

or

    rackup

Then connect your browser to whatever port it says.



#### Deploying on server

I run phusion passenger on my ubuntu apache server. Deploy with capistrano. There's an example conf based on what i use that you may toy around with.


## Why, oh God why?

I don't know. Masochism? Maybe? That's certainly a part of it.


## License
Hah. Lol. Put it this way. If you read this you not entitled in any way to use this application and are soly responsible for all evil it brings your way.
