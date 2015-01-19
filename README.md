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

#### Run in docker

You mount in your photos and a thumbnail folder. Upon start the server will run through your photos and create thumbnails. Mount these somewhere where you don't care. It won't touch your photos so.. they can be read only if you like.. or whatever.

    docker run -v /mnt/mydisk/Album/photos:/sinatra_galleria/public/photos \
               -v /mnt/mydisk/Album/thumbs:/sinatra_galleria/public/thumbs \
               -p 9292:9292 \
               zoomix/sinatra-galleria

It.. it should refresh the thumbnails periodically. Except it doesn't right now. Imma look into that though.. Should fix it in the dockerfile itself. I tried creating a cron that does it nightly, but something's weird. It doesn't seem to want to run. Whatever. I'll get to it.

Right now you have to do it manually.

    docker run -v /mnt/mydisk/Album/photos:/sinatra_galleria/public/photos \
               -v /mnt/mydisk/Album/thumbs:/sinatra_galleria/public/thumbs \
               -p 9292:9292 \
               -w /sinatra_galleria \
               zoomix/sinatra-galleria \
               rake thumb_gen



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

I sincerilly recommend using docker, as above, and mounting in tyour source folder and starting a bash. Something like this.

    docker run -v /Users/zoomix/repos/sinatra_galleria:/sinatra_galleria \
               -p 9292:9292 \
               -w /sinatra_galleria \
               zoomix/sinatra-galleria \
               bash

.. that way you get all the environment and all dependencies without making a mess of your development machine. After that, you can just go

    bundle
    bundle exec rspec spec


If you're not into sanity and eat imagemagick dependency trees for breakfast, you can go ahead and use [RVM](http://rvm.io) and bundler.

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

I used to run phusion passenger on my ubuntu apache server. Deploy with capistrano. There's an example conf based on what i use that you may toy around with.

I have since tasted the sweet sweet taste of docker freedom. I am now on my way to recovery. They have a programme. You get a sponsor. There's some sort of chips embedded in the system, but I haven't figured that out yet..


## Why, oh God, WHY?

I don't know. Masochism? Maybe? That's certainly a part of it. It doesn't really work the way I'd like. But what does ever. =/


## License
Hah. Lol. Put it this way. If you read this you not entitled in any way to use this application and are soly responsible for all evil it brings your way.
