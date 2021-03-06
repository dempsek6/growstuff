# What's Growing Near Me?

This is a forked Growstuff repository with code for a "What's Growing Near Me?" function added to it.  "What's Growing Near Me" allows a user to input their location, and see what crops are being grown within a certain mile radius of that location (the user also inputs the mile radius).  Here are the files I have altered:
- crop.rb now contains a self.growingNearMe function. (line 207)
- crops_controller.rb now contains a growingNearMe function (line 51)
Here are new files I have added:
- "views" now contains a file called growingNearMe.html.haml
- "services" now contains a file called growing_near_me_service.rb
- "index.html.haml" in views/crops now has code for a "What's Growing Near Me" search bar towards the bottom.  On the app itself, this searh bar can be seen below the list of crops.  This code has issues, documented in the "issues" tab.
This code has issues, which are documented in the "issues" tab of this forked repository.

Growstuff's original ReadMe is below.

# Growstuff

[![Build Status](https://travis-ci.org/Growstuff/growstuff.svg?branch=dev)](https://travis-ci.org/Growstuff/growstuff)
[![Coverage Status](https://coveralls.io/repos/Growstuff/growstuff/badge.png)](https://coveralls.io/r/Growstuff/growstuff)
[![Code Climate](https://codeclimate.com/github/Growstuff/growstuff/badges/gpa.svg)](https://codeclimate.com/github/Growstuff/growstuff)

Welcome to the Growstuff project.

Growstuff is an open source/open data project to create a website for
food gardeners.  We crowdsource information on what our members are
growing and harvesting, aggregate it, and make it available as open data
via our API.

Growstuff was founded in 2012 and has been built by dozens of
[contributors](CONTRIBUTORS.md).  We are an inclusive, welcoming project, and
encourage participation from people of all backgrounds and skill levels.

## Important links

* [Issues](http://github.com/Growstuff/growstuff/issues) (features we're
  working on, known bugs, etc)
* [IRC](https://webchat.freenode.net/) growstuff channel (general chat, brainstorming and troubleshooting) or [Gitter](https://gitter.im/Growstuff/growstuff)
* [Wiki](https://github.com/Growstuff/growstuff/wiki) (general documentation, etc. Help by migrating from the [old wiki](https://web.archive.org/web/*/wiki.growstuff.org))

## For coders

Growstuff is built in Ruby on Rails and also uses JavaScript for
frontend features. We welcome contributions -- see
[CONTRIBUTING](CONTRIBUTING.md) for details.

* To set up your development environment, see [Getting started](https://github.com/Growstuff/growstuff/wiki/New-contributor-guide).
* We encourage [pair programming](http://wiki.growstuff.org/index.php/Pairing), especially for newer developers.
* You may also be interested in our [API](https://github.com/Growstuff/growstuff/wiki/API).

## For designers, writers, researchers, data wranglers, and other contributors

There are heaps of ways to get involved and contribute no matter what
your skills and interests.

You might like to check out:

* The [New Contributor Guide](https://github.com/Growstuff/growstuff/wiki/New-contributor-guide)
  page on our wiki, which has lots of detail for different areas

Here on Github, you might find these useful:

* [Waffle](http://waffle.io/Growstuff/growstuff) has stories in "ready" that can be worked on.
* [needs: design](https://github.com/Growstuff/growstuff/labels/needs:%20design) - tasks requiring high-level design
* [needs: visual design](https://github.com/Growstuff/growstuff/labels/needs:%20visual design) - tasks requiring visual/graphical design
* [needs: documentation](https://github.com/Growstuff/growstuff/labels/needs:%20documentation)
* [needs: data](https://github.com/Growstuff/growstuff/labels/needs:%20data) - tasks requiring data entry, data design, data import, or similar
* [curated:beginner](https://github.com/Growstuff/growstuff/labels/curated:%20beginner) - tasks that are ideal for beginner programmers or people new to the project

Feel free to comment on any of the issues on [Github](https://github.com/Growstuff/growstuff/issues).

## Contact

For more information about this project, contact [info@growstuff.org](mailto:info@growstuff.org).

Security Issues: If you find an authorization bypass or data breach, please contact our maintainers directly at [maintainers@growstuff.org](mailto:maintainers@growstuff.org).

You can also contact us on [Twitter](http://twitter.com/growstufforg/) or
[Facebook](https://www.facebook.com/pages/Growstuff/1531133417099494) or [Github](https://github.com/Growstuff/growstuff/issues)..
