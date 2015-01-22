# Sinatra galleria.


#### What it is
It's a simple photo alubm / galleria application you run on your server. It serves albums and photos from a folder to the interwebs as simply as it can. Optimally you would have a number of images in in a number of folder in for instance Dropbox or BTSync. If you're runnig linux and like docker, this is gonna be right up your alley.

Sinatra galleria uses [photoswipe](http://www.photoswipe.com/) for displaying photos, although I'm not married to the idea and I may well change my mind again a couple of times.


#### What it aint and doesn't do

* aint database backed.
* doesn't have an admin gui.
* doesn't have 'users'.
* can't upload images remotely.


## The deal.

#### Run in docker

You mount in your photos and a scratch folder for thumbnails and medium size images. Upon start the server will run through your photos and create the aforementioned temporary files in a scratch-folder. Mount this folder somewhere where you don't care. Sinatra galleria won't touch your photos so.. Shit - you really shouldn't trust me that way. I'm just a dude on the internet. Make 'em read only if you like.. or whatever. This is the way I do it.

    docker run -v /mnt/mydisk/Album/photos:/sinatra_galleria/public/photos \
               -v /mnt/mydisk/Album/scratch:/sinatra_galleria/public/scratch \
               -p 9292:9292 \
               zoomix/sinatra-galleria

It.. it should refresh the thumbnails periodically though. Except it doesn't. Right now. Imma look into that.. Should fix it in the dockerfile itself. I tried creating a cron that does it nightly, but something's weird. It doesn't seem to want to run. Whatever. I'll get to it.

Right now you have to do it manually.

    docker run -v /mnt/mydisk/Album/photos:/sinatra_galleria/public/photos \
               -v /mnt/mydisk/Album/scratch:/sinatra_galleria/public/scratch \
               -p 9292:9292 \
               -w /sinatra_galleria \
               zoomix/sinatra-galleria \
               rake thumb_gen



#### Folder setup

The folder setup:

    - public         <- in the root of this project
      - photos       <- you create this. Ideally this is a link to dropbox or something.
        - album a    <- each folder is an album. No dots in folder names though. Weird that.
          image1.jpg 
          image2.jpg
        - album b
          image3.jpg
          image4.jpg
        ignored_image
      - scratch       <- these are the temporary files. Link this folder to a temp area somewhere.
        - thumbs
          - same albums as above only with thumbnails
        - medium
          - same albums as above only with medium sized images


#### Running locally

I sincerilly recommend using docker, as above, and mounting in your source folder and starting a bash. Something like this.

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

Before you can see anything you'll need to generate some thumbnails and (optinally) medium sized images for your images. Use the rake-taks.

    rake thumb_gen med_gen

You can put this into a crontab and have it run every day or every couple of hours. It will try to make thumbnails of all image formats it recognizes. It is idempotent and you can kill it and restart it any time and it will continue from where it left off.



You run the app by going
    
    ruby galleria.app

or

    rackup

Then connect your browser to whatever port it says.



#### Deploying on server

I used to run phusion passenger on my ubuntu apache server. Deploy with capistrano. There's an example conf based on what i use that you may toy around with.

I have since tasted the sweet sweet taste of docker freedom. I am now on my way to recovery. They have a programme. You get a sponsor. There's some sort of chips in there for some reason, but I haven't figured that out yet..


## Why, oh God, WHY?

I don't know. Masochism? Maybe? That's certainly a part of it. It doesn't really work the way I'd like. But what does ever. =/

I really wanted a simple server to show my images. I wanted it to work on a phone as well as on a desktop. And it's a right of passage for programmers. I sincerely belive that you're not a programmer until you've decided that you need to write your own photo album backend. Until then you're just playing around.

That said, I have made a bit of a mess of this code. I hope you're not judging me too harshly. I only ever get to work on it a couple of hours a year and even then I'm usually interrupted by screaming childern and spouses that (quite rightly) have opinions on how I prioritize my tasks. 


## License
Hah. Lol. Put it this way. If you read this you not entitled in any way to use this application and are soly responsible for all evil it brings your way.
