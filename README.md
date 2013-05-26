FauxData
========

by Chris Stansbury

Description
-----------

FauxData was created to quickly generate random employee demographic data
which is used for demonstrating your application and application's reporting
features.  Address data is pulled from US Census records, keeping the US city, 
US state, and US zip code in sync, while street names are randomly pulled.


Documentation
-------------


Examples
--------

    require 'pp'
    require 'faux_data'

    pg = FauxData::PersonGenerator.new
    person = pg.person
    pp person

For more examples see the examples/ directory of this project.



Supported Platforms
-------------------

Known to work on

  1.8.7, 1.9.3
  


Questions and/or Comments
-------------------------

Feel free to email [Chris Stansbury](mailto:chris@koozie.org) with any questions.
