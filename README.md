FauxData
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

    require 'pp'

    pg = FauxData::PersonGenerator.new
    person = pg.person
    pp person


Supported Platforms
-------------------

Known to work on

    1.8.7
  
For more examples see the examples/ directory of this project.


Questions and/or Comments
-------------------------

Feel free to email [Chris Stansbury](mailto:chris@koozie.org) with any questions.
