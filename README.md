FauxDate
========

by Chris Stansbury

Description
-----------

FauxData was created to quickly generate random employee demographic data
which is used for demostrating your application and application's reporting
features.  Address data is pulled from US Census records, keeping the US city, 
US state, and US zip code in sync, while street names are randomly pulled.


Documentation
-------------


Examples
--------


== Examples

Basic usage:

  ask("Company?  ") { |q| q.default = "none" }

Validation:

  ask("Age?  ", Integer) { |q| q.in = 0..105 }
  ask("Name?  (last, first)  ") { |q| q.validate = /\A\w+, ?\w+\Z/ }

Type conversion for answers:

  ask("Birthday?  ", Date)
  ask("Interests?  (comma sep list)  ", lambda { |str| str.split(/,\s*/) })

Reading passwords:

  ask("Enter your password:  ") { |q| q.echo = false }
  ask("Enter your password:  ") { |q| q.echo = "x" }

ERb based output (with HighLine's ANSI color tools):

  say("This should be <%= color('bold', BOLD) %>!")

Menus:

  choose do |menu|
    menu.prompt = "Please choose your favorite programming language?  "
  
    menu.choice(:ruby) { say("Good choice!") }
    menu.choices(:python, :perl) { say("Not from around here, are you?") }
  end
  
For more examples see the examples/ directory of this project.

== Installing

See the INSTALL file for instructions.

== Questions and/or Comments

Feel free to email {James Edward Gray II}[mailto:james@grayproductions.net] or
{Gregory Brown}[mailto:gregory.t.brown@gmail.com] with any questions.
