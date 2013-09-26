-- This project is being completed with no affiliation with FlightAware. For any issues, please contact me here on GitHub. -- 

FlightXML2REST

Implements the FlightXML2 API available from FlightAware utilizing a RESTful architecture (as opposed the already available SOAP architecture).
Most methods are available in the same way as the SOAP client.

[![Code Climate](https://codeclimate.com/github/auzroz/flightxml2-jsonclient-ruby.png)](https://codeclimate.com/github/auzroz/flightxml2-jsonclient-ruby)

[![Coverage Status](https://coveralls.io/repos/auzroz/flightxml2-jsonclient-ruby/badge.png)](https://coveralls.io/r/auzroz/flightxml2-jsonclient-ruby)

----------------------------------------------------------------------
FlightXML

Using the FlightXML API, programs can query the FlightAware live
flight information and historical datasets. Queries for in-flight
aircraft return a set of matching aircraft based on a combination of
location, flight or tail number, origin and/or destination airport,
aircraft type, and/or a low-to-high range of altitude and/or ground
speed, among others. For each matching aircraft, data returned
includes the flight or tail number, the aircraft type, origin and
destination, time the last position was received, and the longitude,
latitude, groundspeed, and altitude of that position. Matching
flights' flight tracks can be requested as well.

For airports, FlightXML queries can return a list of scheduled
flights, flights that have departed, flights that are enroute to the
airport, and flights that have arrived at the airport.


http://flightaware.com/commercial/flightxml/
https://github.com/flightaware/flightxml2-client-ruby