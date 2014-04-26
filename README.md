chchruby-robotwars
==================

    arena/          # This gets shipped to our players via git
    bin/            # Scripts for setting up and running things
    bots.example/   # Good bots for testing/debugging with
    git_hooks/      # Try to make our git workflow sane (hint: don't use git next time)
    webapp/         # 'Dumb' rails app to display scoreboard

Setup
=====

  * Have a unprivileged `git` user
  * Inspect the variables in [.config](.config)
  * Make sure you can run the rrobots command, see [arena/README.md](arena/README.md)
  * Setup the rails app in the usual way. `cd webapp; rake db:whatever`

Workflow
========

    bin/clean && bin/setup_arena && bin/run_git_daemon

In another tab:

    bin/schedule_matches

In another tab:

    cd webapp
    bin/rails server

At this point, players should be able to visit the leaderboard page,
see the endpoint for the git repository, clone the repo and push their bots.
Tournaments will be run automatically at the frequency defined in [bin/schedule_matches](bin/schedule_matches).

Notes
=====

  * Git is a really poor choice for transport mechanism here.
    If there are ever any conflicts between branches,
    no-one will be able to push anymore.
  * The webapp/ is a bit of a mess. It's a direct copy + hack-n-slash from the
    original codegolf Rails app.
    There is some meaningful logic in [match.rake](webapp/lib/tasks/match.rake), but that's about all.
