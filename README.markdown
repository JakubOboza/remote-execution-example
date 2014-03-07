# What is it ?
Ox :) This is a simple demo of a remote execution of shell commands. Very big simplification.

# Requirements
Guest boxes have to have running `rushd` daemon in order to make communcation and command execution possible

## To run it on my raspberry pi....
I had to install `sudo apt-get install ruby-dev` and `sudo gem install mongrel --pre`.
Next you can start `rushd` by typing `rushd`. Sadly it only supports mongrel as backend server.

# How to setup

* Setup rails app `bundle install` i used ruby 2.1 suggest to do the same
* Start server `bundle exec rails server`
* Start worker `bundle exec rake resque:work QUEUE='*'`
* hit `localhost:3000`

and Enjoy!

