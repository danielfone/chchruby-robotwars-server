Getting started
===============

Presumably you've cloned the repo by now.

    # Install the project dependencies
    $ gem install bundler
    $ bundle install

    # Run the sample robots
    $ bundle exec rrobots bots/*.rb

At this point, you should witness a battle between our two default AIs.

Now we'll set up the git workflow.

    $ git checkout -b [your-team-name]
    $ git push --set-upstream origin [your-team-name]

Copy one of the existing files in the bots/ directory and make your own.
Please limit yourself to one file. Classname must match filename.
Once you've tested your bot locally, you can push your code in time for the
tournament (see below). Only ever push to your branch, it will be automatically
merged into master on the server.

    $ git push

After the tournament, you might want to pull everyone's code - this is open source
after all!

    $ git pull origin master

Rinse and repeat.

Tournament Rules
================

Tournaments will be automatically run every 20 minutes with whatever code has
been pushed at the time.

We'll run with the arguments:

    --resolution "1600,900" --timeout 2500

Bots are scored on a kind of KDR (Kill/Deaths Ratio) but with energy instead of lives.

    def score
      (damage_given.to_f + 1) / (damage_taken.to_f + 1)
    end

Possible Install Issues
=======================

You may have a problem installing the GOSU library.. if so.. there's a helpful
error message which links to this:

https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux

You may need to install a few packages

Useful resources:
=================

http://rubydoc.info/gems/rrobots/0.0.1/frames

https://github.com/ralreegorganon/rrobots

    $ bundle open rrobots # Read the source Luke!

Some methods...
===============

    battlefield_height  #the height of the battlefield
    battlefield_width   #the width of the battlefield
    energy              #your remaining energy (if this drops below 0 you are dead)
    gun_heading         #the heading of your gun, 0 pointing east, 90 pointing
                        #north, 180 pointing west, 270 pointing south
    gun_heat            #your gun heat, if this is above 0 you can't shoot
    heading             #your robots heading, 0 pointing east, 90 pointing north,
                        #180 pointing west, 270 pointing south
    size                #your robots radius, if x <= size you hit the left wall
    radar_heading       #the heading of your radar, 0 pointing east,
                        #90 pointing north, 180 pointing west, 270 pointing south
    time                #ticks since match start
    speed               #your speed (-8/8)
    x                   #your x coordinate, 0...battlefield_width
    y                   #your y coordinate, 0...battlefield_height
    accelerate(param)   #accelerate (max speed is 8, max accelerate is 1/-1,
                        #negativ speed means moving backwards)
    stop                #accelerates negativ if moving forward (and vice versa),
                        #may take 8 ticks to stop (and you have to call it every tick)
    fire(power)         #fires a bullet in the direction of your gun,
                        #power is 0.1 - 3, this power will heat your gun
    turn(degrees)       #turns the robot (and the gun and the radar),
                        #max 10 degrees per tick
    turn_gun(degrees)   #turns the gun (and the radar), max 30 degrees per tick
    turn_radar(degrees) #turns the radar, max 60 degrees per tick
    dead                #true if you are dead
    say(msg)            #shows msg above the robot on screen
    broadcast(msg)      #broadcasts msg to all bots (they receive 'broadcasts'
                        #events with the msg and rough direction)
