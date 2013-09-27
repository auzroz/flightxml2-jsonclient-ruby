#AircraftType
class AircraftTypeRequest
  attr_accessor :type  
  def initialize(type = nil)
    @type = type
  end 
  def post
    "type=#@type"
  end
end

class AircraftTypeResults
  attr_accessor :aircraftTypeResult
  def initialize(aircraftTypeResult = nil)
    aircraftTypeResult = JSON.parse(aircraftTypeResult)['AircraftTypeResult']
    @aircraftTypeResult = AircraftTypeStruct.new(aircraftTypeResult['description'], aircraftTypeResult['manufacturer'], aircraftTypeResult['type'])
  end
end

class AircraftTypeStruct
  attr_accessor :description, :manufacturer, :type
  def initialize (description = nil, manufacturer = nil, type = nil)
    @manufacturer = manufacturer
    @type = type
    @description = description
  end
end

#AirlineFlightInfo
class AirlineFlightInfoRequest
    attr_accessor :faFlightID  
  def initialize(faFlightID = nil)
    @faFlightID = faFlightID
  end 
  def post
    "faFlightID=#@faFlightID"
  end
end

class AirlineFlightInfoResults
    attr_accessor :airlineFlightInfoResult
  def initialize(airlineFlightInfoResult = nil)
    airlineFlightInfoResult = JSON.parse(airlineFlightInfoResult)['AirlineFlightInfoResult']
    @airlineFlightInfoResult = AirlineFlightInfoStruct.new(
                                                            airlineFlightInfoResult['bag_claim'],
                                                            airlineFlightInfoResult['codeshares'],
                                                            airlineFlightInfoResult['faFlightID'],
                                                            airlineFlightInfoResult['gate_dest'],
                                                            airlineFlightInfoResult['gate_orig'],
                                                            airlineFlightInfoResult['ident'],
                                                            airlineFlightInfoResult['meal_service'],
                                                            airlineFlightInfoResult['seats_cabin_business'],
                                                            airlineFlightInfoResult['seats_cabin_coach'],
                                                            airlineFlightInfoResult['seats_cabin_first'],
                                                            airlineFlightInfoResult['tailnumber'],
                                                            airlineFlightInfoResult['terminal_dest'],
                                                            airlineFlightInfoResult['terminal_orig']
                                                          )
  end
end

class AirlineFlightInfoStruct
    attr_accessor :bag_claim, 
                  :codeshares, 
                  :faFlightID, 
                  :gate_dest, 
                  :gate_orig, 
                  :ident, 
                  :meal_service, 
                  :seats_cabin_business, 
                  :seats_cabin_coach, 
                  :seats_cabin_first, 
                  :tailnumber,
                  :terminal_dest,
                  :terminal_orig
                  
  def initialize (bag_claim = nil, 
                  codeshares = [], 
                  faFlightID = nil, 
                  gate_dest = nil, 
                  gate_origin = nil, 
                  ident = nil, 
                  meal_service = nil, 
                  seats_cabin_business = nil,
                  seats_cabin_coach = nil,
                  seats_cabin_first = nil,
                  tailnumber = nil,
                  terminal_dest = nil,
                  terminal_orig = nil)
    @bag_claim = bag_claim 
    @codeshares = codeshares
    @faFlightID = faFlightID 
    @gate_dest = gate_dest 
    @gate_origin = gate_origin
    @ident = ident
    @meal_service = meal_service 
    @seats_cabin_business = seats_cabin_business
    @seats_cabin_coach = seats_cabin_coach
    @seats_cabin_first = seats_cabin_first
    @tailnumber = tailnumber
    @terminal_dest = terminal_dest
    @terminal_orig = terminal_orig
  end
end

#AirlineFlightSchedule
class AirlineFlightSchedulesRequest
  attr_accessor :airline, :destination, :endDate, :flightno, :howMany, :offset, :origin, :startDate
  def initialize(airline = nil, destination = nil, endDate = nil, flightno = nil, howMany = nil, offset = nil, origin = nil, startDate = nil)
    @airline = airline
    @destination = destination
    @endDate = endDate
    @flightno = flightno
    @howMany = howMany
    @offset = offset
    @origin = origin
    @startDate = startDate
  end
  def post
    "airline=#@airline&destination=#@destination&endDate=#@endDate&flightno=#@flightno&howMany=#@howMany&offset=#@offset&origin=#@origin&startDate=#@startDate"
  end
end

class AirlineFlightSchedulesResults
  attr_accessor :airlineFlightSchedulesResult
  def initialize(airlineFlightSchedulesResult = nil)
    airlineFlightSchedulesResult = JSON.parse(airlineFlightSchedulesResult)['AirlineFlightSchedulesResult']
    @airlineFlightSchedulesResult = ArrayOfAirlineFlightScheduleStruct.new([], airlineFlightSchedulesResult['next_offset'])
    airlineFlightSchedulesResult['data'].each do |data|
      @airlineFlightSchedulesResult.data << AirlineFlightScheduleStruct.new(data['actual_ident'],
                                                          data['aircrafttype'],
                                                          data['arrivaltime'],
                                                          data['departuretime'],
                                                          data['destination'],
                                                          data['ident'],
                                                          data['meal_service'],
                                                          data['origin'],
                                                          data['seats_cabin_business'],
                                                          data['seats_cabin_coach'],
                                                          data['seats_cabin_first']
                                                         )
    end
  end
end

class AirlineFlightScheduleStruct
  attr_accessor :actual_ident, 
                :aircrafttype, 
                :arrivaltime, 
                :departuretime, 
                :destination, 
                :ident, 
                :meal_service, 
                :origin, 
                :seats_cabin_business, 
                :seats_cabin_coach,
                :seats_cabin_first
                
  def initialize (actual_ident = nil, 
                  aircrafttype = nil, 
                  arrivaltime = nil, 
                  departuretime = nil, 
                  destination = nil, 
                  ident = nil, 
                  meal_service = nil,
                  origin = nil,
                  seats_cabin_business = nil,
                  seats_cabin_coach = nil,
                  seats_cabin_first = nil
                  )
    @actual_ident = actual_ident
    @aircrafttype = aircrafttype
    @arrivaltime = arrivaltime
    @departuretime = departuretime
    @destination = destination
    @ident = ident
    @meal_service = meal_service
    @origin = origin
    @seats_cabin_business = seats_cabin_business
    @seats_cabin_coach = seats_cabin_coach
    @seats_cabin_first = seats_cabin_first
  end

end

class ArrayOfAirlineFlightScheduleStruct
  attr_accessor :data, :next_offset
  def initialize(data = [], next_offset = nil)
    @data = data
    @next_offset = next_offset
  end
end

#AirlineInfoRequest
class AirlineInfoRequest
  attr_accessor :airlineCode 
  def initialize(airlineCode = nil)
    @airlineCode = airlineCode
  end 
  def post
    "airlineCode=#@airlineCode"
  end
end

class AirlineInfoResults
  attr_accessor :airlineInfoResult
  def initialize(airlineInfoResult = nil)
    airlineInfoResult = JSON.parse(airlineInfoResult)['AirlineInfoResult']
    @airlineInfoResult = AirlineInfoStruct.new(airlineInfoResult['callsign'],
                                               airlineInfoResult['country'],
                                               airlineInfoResult['location'],
                                               airlineInfoResult['name'],
                                               airlineInfoResult['phone'],
                                               airlineInfoResult['shortname'],
                                               airlineInfoResult['url']
                                              )
  end
end

class AirlineInfoStruct
  attr_accessor :callsign, :country, :location, :name, :phone, :shortname, :url
  def initialize (callsign = nil, country = nil, location = nil, name = nil, phone = nil, shortname = nil, url = nil)
    @callsign = callsign
    @country = country
    @location = location
    @name = name
    @phone = phone
    @shortname = shortname
    @url = url
  end
end


#AirlineInsight
class AirlineInsightRequest
  attr_accessor :destination, :origin, :reportType 
  def initialize(destination = nil, origin = nil, reportType = nil)
    @destination = destination
    @origin = origin
    @reportType = reportType
  end 
  def post
    "destination=#@destination&origin=#@origin&reportType=#@reportType"
  end
end

class AirlineInsightResults
  attr_accessor :airlineInsightResult
  def initialize(airlineInsightResult = nil)
    airlineInsightResult = JSON.parse(airlineInsightResult)['AirlineInsightResult']
    @airlineInsightResult = ArrayOfAirlineInsightStruct.new([], airlineInsightResult['end_date'], airlineInsightResult['start_date'])
    airlineInsightResult['data'].each do |data|
      @airlineInsightResult.data << AirlineInsightStruct.new(data['carrier'],
                                                          data['destination'],
                                                          data['fare_max'],
                                                          data['fare_median'],
                                                          data['fare_min'],
                                                          data['flights_performed'],
                                                          data['flights_scheduled'],
                                                          data['layover'],
                                                          data['opcarrier'],
                                                          data['origin'],
                                                          data['percent'],
                                                          data['total_mail'],
                                                          data['total_passengers'],
                                                          data['total_payload'],
                                                          data['total_seats']
                                                         )
    end
  end
end

class AirlineInsightStruct
  attr_accessor :carrier,
                :destination,
                :fare_max,
                :fare_median,
                :fare_min,
                :flights_performed,
                :flights_scheduled,
                :layover,
                :opcarrier,
                :origin,
                :percent,
                :total_mail,
                :total_passengers,
                :total_payload,
                :total_seats
                
  def initialize (carrier = nil,
                  destination = nil,
                  fare_max = nil,
                  fare_median = nil,
                  fare_min = nil,
                  flights_performed = nil,
                  flights_scheduled = nil,
                  layover = nil,
                  opcarrier = nil,
                  origin = nil,
                  percent = nil,
                  total_mail = nil,
                  total_passengers = nil,
                  total_payload = nil,
                  total_seats = nil)
    @carrier = carrier
    @destination = destination
    @fare_max = fare_max
    @fare_median = fare_median
    @fare_min = fare_min
    @flights_performed = flights_performed
    @flights_scheduled = flights_scheduled
    @layover = layover
    @opcarrier = opcarrier
    @origin = origin
    @percent = percent
    @total_mail = total_mail
    @total_passengers = total_passengers
    @total_payload = total_payload
    @total_seats = total_seats
  end
end

class ArrayOfAirlineInsightStruct
  attr_accessor :data, :end_date, :start_date
  def initialize(data = [], end_date = nil, start_date = nil)
    @data = data
    @end_date = end_date
    @start_date = start_date
  end
end


#AirportInfo
class AirportInfoRequest
  attr_accessor :airportCode  
  def initialize(airportCode = nil)
    @airportCode = airportCode
  end 
  def post
    "airportCode=#@airportCode"
  end
end

class AirportInfoResults
  attr_accessor :airportInfoResult
  def initialize(airportInfoResult = nil)
    airportInfoResult = JSON.parse(airportInfoResult)['AirportInfoResult']
    @airportInfoResult = AirportInfoStruct.new(airportInfoResult['latitude'], 
                                                airportInfoResult['location'],
                                                airportInfoResult['longitude'],
                                                airportInfoResult['name'],
                                                airportInfoResult['timzone'],   
                                                )
  end
end

class AirportInfoStruct
  attr_accessor :latitude, :location, :longitude, :name, :timezone
  def initialize (latitude = nil, location = nil, longitude = nil, name = nil, timezone = nil)
    @latitude = latitude
    @location = location
    @longitude = longitude
    @name = name
    @timezone = timezone
  end
end

#AllAirlines
class AllAirlinesRequest  
  def initialize()
  end 
  def post
    ""
  end
end

class AllAirlinesResults
  attr_accessor :allAirlinesResult
  def initialize(allAirlinesResult = nil)
    allAirlinesResult = JSON.parse(allAirlinesResult)['AllAirlinesResult']
    @allAirlinesResult = ArrayOfString.new()
    allAirlinesResult['data'].each do |data|
      @allAirlinesResult.data << data
    end
  end
end

class ArrayOfString
  attr_accessor :data
  def initialize (data = [])
    @data = data
  end
end

#AllAirports
class AllAirportsRequest  
  def initialize()
  end 
  def post
    ""
  end
end

class AllAirportsResults
  attr_accessor :allAirportsResult
  def initialize(allAirportsResult = nil)
    allAirportsResult = JSON.parse(allAirportsResult)['AllAirportsResult']
    @allAirportsResult = ArrayOfString.new()
    allAirportsResult['data'].each do |data|
      @allAirportsResult.data << data
    end
  end
end

#Arrived
class ArrivedRequest
  attr_accessor :airport, :filter, :howMany, :offset 
  def initialize(airport = nil, filter = nil, howMany = nil, offset = nil)
    @airport = airport
    @filter = filter
    @howMany = howMany
    @offset = offset
  end 
  def post
    "airport=#@airport&filter=#@filter&howMany=#@howMany&offset=#@offset"
  end
end

class ArrivedResults
  attr_accessor :arrivedResult
  def initialize(arrivedResult = nil)
    arrivedResult = JSON.parse(arrivedResult)['ArrivedResult']
    @arrivedResult = ArrivalStruct.new([], arrivedResult['next_offset'])
    arrivedResult['arrivals'].each do |arrival|
      @arrivedResult.arrivals << ArrivalFlightStruct.new(arrival['actualarrivaltime'],
                                                         arrival['actualdeparturetime'],
                                                         arrival['aircrafttype'],
                                                         arrival['destination'],
                                                         arrival['destinationCity'],
                                                         arrival['destinationName'],
                                                         arrival['ident'],
                                                         arrival['origin'],
                                                         arrival['originCity'],
                                                         arrival['originName']
                                                         )
    end
  end
end

class ArrivalStruct
  attr_accessor :arrivals, :next_offset
  def initialize (arrivals = [], next_offset = nil)
    @arrivals = arrivals
    @next_offset = next_offset
  end
end

class ArrivalFlightStruct
  attr_accessor :actualarrivaltime, 
                :actualdeparturetime, 
                :aircrafttype, 
                :destination, 
                :destinationCity, 
                :destinationName, 
                :ident, 
                :origin, 
                :originCity, 
                :originName
                
  def initialize(actualarrivaltime = nil,
                 actualdeparturetime = nil,
                 aircrafttype = nil,
                 destination = nil,
                 destinationCity = nil,
                 destinationName = nil,
                 ident = nil,
                 origin = nil,
                 originCity = nil,
                 originName = nil
                ) 
    @actualarrivaltime = actualarrivaltime
    @actualdeparturetime = actualdeparturetime
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
  end
end


#BlockIdentCheck
class BlockIdentCheckRequest
  attr_accessor :ident  
  def initialize(ident = nil)
    @ident = ident
  end 
  def post
    "ident=#@ident"
  end
end

class BlockIdentCheckResults
  attr_accessor :blockIdentCheckResult
  def initialize(blockIdentCheckResult = nil)
    blockIdentCheckResult = JSON.parse(blockIdentCheckResult)['BlockIdentCheckResult']
    @blockIdentCheckResult = blockIdentCheckResult
  end
end


#CountAirportOperations
class CountAirportOperationsRequest
  attr_accessor :airport
  def initialize(airport = nil)
    @airport = airport
  end 
  def post
    "airport=#@airport"
  end
end

class CountAirportOperationsResults
  attr_accessor :countAirportOperationsResult
  def initialize(countAirportOperationsResult = nil)
    countAirportOperationsResult = JSON.parse(countAirportOperationsResult)['CountAirportOperationsResult']
    @countAirportOperationsResult = CountAirportOperationsStruct.new(countAirportOperationsResult['departed'], 
                                                           countAirportOperationsResult['enroute'], 
                                                           countAirportOperationsResult['scheduled_arrivals'],
                                                           countAirportOperationsResult['scheduled_departures']
                                                          )
  end
end

class CountAirportOperationsStruct
  attr_accessor :departed, :enroute, :scheduled_arrivals, :scheduled_departures
  def initialize (departed = nil, enroute = nil, scheduled_arrivals = nil, scheduled_departures = nil)
    @departed = departed
    @enroute = enroute
    @scheduled_arrivals = scheduled_arrivals
    @scheduled_departures = scheduled_departures
  end
end

#DecodeFlightRoute
class DecodeFlightRouteRequest
  attr_accessor :faFlightID
  def initialize(faFlightID = nil)
    @faFlightID = faFlightID
  end 
  def post
    "faFlightID=#@faFlightID"
  end
end

class DecodeFlightRouteResults
  attr_accessor :decodeFlightRouteResult
  def initialize(decodeFlightRouteResult = nil)
    decodeFlightRouteResult= JSON.parse(decodeFlightRouteResult)['DecodeFlightRouteResult']
    @decodeFlightRouteResult  = ArrayOfFlightRouteStruct.new([],decodeFlightRouteResult['next_offset'])
    decodeFlightRouteResult['data'].each do |data|
      @decodeFlightRouteResult.data << FlightRouteStruct.new(data['latitude'],
                                                             data['longitude'],
                                                             data['name'],
                                                             data['type']
                                                            )
    end
  end
end

class FlightRouteStruct
  attr_accessor :latitude, :longitude, :name, :type
  def initialize (latitude = nil, longitude = nil, name = nil, type = nil)
    @latitude = latitude
    @longitude = longitude
    @name = name
    @type = type
  end
end

class ArrayOfFlightRouteStruct
  attr_accessor :data, :next_offset
  def initialize (data = [], next_offset = nil)
    @data = data
    @next_offset = next_offset
  end
end


#DecodeRoute
class DecodeRouteRequest
  attr_accessor :destination, :origin, :route
  def initialize(destination = nil, origin = nil, route = nil)
    @destination = destination
    @origin = origin
    @route = route
  end 
  def post
    "destination=#@destination&origin=#@origin&route=#@route"
  end
end

class DecodeRouteResults
  attr_accessor :decodeRouteResult
  def initialize(decodeRouteResult = nil)
    puts decodeRouteResult
    decodeRouteResult = JSON.parse(decodeRouteResult)['DecodeRouteResult']
    @decodeRouteResult  = ArrayOfFlightRouteStruct.new([],decodeRouteResult['next_offset'])
    decodeRouteResult['data'].each do |data|
      @decodeRouteResult.data << FlightRouteStruct.new(data['latitude'],
                                                       data['longitude'],
                                                       data['name'],
                                                       data['type']
                                                      )
    end
  end
end


#DeleteAlert
class DeleteAlertRequest
  attr_accessor :alert_id  
  def initialize(alert_id = nil)
    @alert_id = alert_id
  end 
  def post
    "alert_id=#@alert_id"
  end
end

class DeleteAlertResults
  attr_accessor :deleteAlertResult
  def initialize(deleteAlertResult = nil)
    deleteAlertResult = JSON.parse(deleteAlertResult)['DeleteAlertResult']
    @deleteAlertResult = deleteAlertResult
  end
end


#Departed
class DepartedRequest
  attr_accessor :airport, :filter, :howMany, :offset 
  def initialize(airport = nil, filter = nil, howMany = nil, offset = nil)
    @airport = airport
    @filter = filter
    @howMany = howMany
    @offset = offset
  end 
  def post
    "airport=#@airport&filter=#@filter&howMany=#@howMany&offset=#@offset"
  end
end

class DepartedResults
  attr_accessor :departedResult
  def initialize(departedResult = nil)
    departedResult = JSON.parse(departedResult)['DepartedResult']
    @departedResult = DepartureStruct.new([], departedResult['next_offset'])
    departedResult['departures'].each do |departure|
      @departedResult.departures << DepartureFlightStruct.new(departure['actualarrivaltime'],
                                                              departure['actualdeparturetime'],
                                                              departure['aircrafttype'],
                                                              departure['destination'],
                                                              departure['destinationCity'],
                                                              departure['destinationName'],
                                                              departure['estimatedarrivaltime'],
                                                              departure['ident'],
                                                              departure['origin'],
                                                              departure['originCity'],
                                                              departure['originName']
                                                              )
    end
  end
end

class DepartureStruct
  attr_accessor :departures, :next_offset
  def initialize (departures = [], next_offset = nil)
    @departures = departures
    @next_offset = next_offset
  end
end

class DepartureFlightStruct
  attr_accessor :actualarrivaltime, 
                :actualdeparturetime, 
                :aircrafttype, 
                :destination, 
                :destinationCity, 
                :destinationName,
                :estimatedarrivaltime, 
                :ident, 
                :origin, 
                :originCity, 
                :originName
                
  def initialize(actualarrivaltime = nil,
                 actualdeparturetime = nil,
                 aircrafttype = nil,
                 destination = nil,
                 destinationCity = nil,
                 destinationName = nil,
                 estimatedarrivaltime = nil,
                 ident = nil,
                 origin = nil,
                 originCity = nil,
                 originName = nil
                ) 
    @actualarrivaltime = actualarrivaltime
    @actualdeparturetime = actualdeparturetime
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @estimatedarrivaltime = estimatedarrivaltime
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
  end
end


#Enroute
class EnrouteRequest
  attr_accessor :airport, :filter, :howMany, :offset 
  def initialize(airport = nil, filter = nil, howMany = nil, offset = nil)
    @airport = airport
    @filter = filter
    @howMany = howMany
    @offset = offset
  end 
  def post
    "airport=#@airport&filter=#@filter&howMany=#@howMany&offset=#@offset"
  end
end

class EnrouteResults
  attr_accessor :enrouteResult
  def initialize(enrouteResult = nil)
    enrouteResult = JSON.parse(enrouteResult)['EnrouteResult']
    @enrouteResult = EnrouteStruct.new([], enrouteResult['next_offset'])
    enrouteResult['enroute'].each do |enroute|
      @enrouteResult.enroute << EnrouteFlightStruct.new(enroute['actualdeparturetime'],
                                                  enroute['aircrafttype'],
                                                  enroute['destination'],
                                                  enroute['destinationCity'],
                                                  enroute['destinationName'],
                                                  enroute['estimatedarrivaltime'],
                                                  enroute['filed_departuretime'],
                                                  enroute['ident'],
                                                  enroute['origin'],
                                                  enroute['originCity'],
                                                  enroute['originName']
                                                  )
    end
  end
end

class EnrouteStruct
  attr_accessor :enroute, :next_offset
  def initialize (enroute = [], next_offset = nil)
    @enroute = enroute
    @next_offset = next_offset
  end
end

class EnrouteFlightStruct
  attr_accessor :actualdeparturetime, 
                :aircrafttype, 
                :destination, 
                :destinationCity, 
                :destinationName,
                :estimatedarrivaltime,
                :filed_departuretime, 
                :ident, 
                :origin, 
                :originCity, 
                :originName
                
  def initialize(actualdeparturetime = nil,
                 aircrafttype = nil,
                 destination = nil,
                 destinationCity = nil,
                 destinationName = nil,
                 estimatedarrivaltime = nil,
                 filed_departuretime = nil,
                 ident = nil,
                 origin = nil,
                 originCity = nil,
                 originName = nil
                ) 
    @actualdeparturetime = actualdeparturetime
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @estimatedarrivaltime = estimatedarrivaltime
    @filed_departuretime = filed_departuretime
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
  end
end

#FleetArrived
class FleetArrivedRequest
  attr_accessor :fleet, :howMany, :offset 
  def initialize(fleet = nil, howMany = nil, offset = nil)
    @fleet = fleet
    @howMany = howMany
    @offset = offset
  end 
  def post
    "fleet=#@fleet&howMany=#@howMany&offset=#@offset"
  end
end

class FleetArrivedResults
  attr_accessor :fleetArrivedResult
  def initialize(fleetArrivedResult = nil)
    fleetArrivedResult = JSON.parse(fleetArrivedResult)['FleetArrivedResult']
    @fleetArrivedResult = ArrivalStruct.new([], fleetArrivedResult['next_offset'])
    fleetArrivedResult['arrivals'].each do |arrival|
      @fleetArrivedResult.arrivals << ArrivalFlightStruct.new(arrival['actualarrivaltime'],
                                                              arrival['actualdeparturetime'],
                                                              arrival['aircrafttype'],
                                                              arrival['destination'],
                                                              arrival['destinationCity'],
                                                              arrival['destinationName'],
                                                              arrival['ident'],
                                                              arrival['origin'],
                                                              arrival['originCity'],
                                                              arrival['originName']
                                                              )
    end
  end
end


#FleetScheduled
class FleetScheduledRequest
  attr_accessor :fleet, :howMany, :offset 
  def initialize(fleet = nil, howMany = nil, offset = nil)
    @fleet = fleet
    @howMany = howMany
    @offset = offset
  end 
  def post
    "fleet=#@fleet&howMany=#@howMany&offset=#@offset"
  end
end

class FleetScheduledResults
  attr_accessor :fleetScheduledResult
  def initialize(fleetScheduledResult = nil)
    fleetScheduledResult = JSON.parse(fleetScheduledResult)['FleetScheduledResult']
    @fleetScheduledResult = ScheduledStruct.new(fleetScheduledResult['next_offset'], [])
    fleetScheduledResult['scheduled'].each do |scheduled|
      @fleetScheduledResult.scheduled << ScheduledFlightStruct.new(scheduled['aircrafttype'],
                                                                   scheduled['destination'],
                                                                   scheduled['destinationCity'],
                                                                   scheduled['destinationName'],
                                                                   scheduled['estimatedarrivaltime'],
                                                                   scheduled['filed_departuretime'],
                                                                   scheduled['ident'],
                                                                   scheduled['origin'],
                                                                   scheduled['originCity'],
                                                                   scheduled['originName']
                                                                  )
    end
  end
end

class ScheduledStruct
  attr_accessor :next_offset, :scheduled
  def initialize (next_offset = nil, scheduled = [])
    @next_offset = next_offset
    @scheduled = scheduled
  end
end

class ScheduledFlightStruct
  attr_accessor :aircrafttype, 
                :destination, 
                :destinationCity, 
                :destinationName,
                :estimatedarrivaltime,
                :filed_departuretime, 
                :ident, 
                :origin, 
                :originCity, 
                :originName
                
  def initialize(aircrafttype = nil,
                 destination = nil,
                 destinationCity = nil,
                 destinationName = nil,
                 estimatedarrivaltime = nil,
                 filed_departuretime = nil,
                 ident = nil,
                 origin = nil,
                 originCity = nil,
                 originName = nil
                ) 
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @estimatedarrivaltime = estimatedarrivaltime
    @filed_departuretime = filed_departuretime
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
  end
end


#FlightInfo
class FlightInfoRequest
  attr_accessor :howMany, :ident
  def initialize(howMany = nil, ident = nil)
    @howMany = howMany
    @ident = ident
  end 
  def post
    "howMany=#@howMany&ident=#@ident"
  end
end

class FlightInfoResults
  attr_accessor :flightInfoResult
  def initialize(flightInfoResult = nil)
    flightInfoResult = JSON.parse(flightInfoResult)['FlightInfoResult']
    @flightInfoResult = FlightInfoStruct.new([], flightInfoResult['next_offset'])
    flightInfoResult['flights'].each do |flight|
      @flightInfoResult.flights << FlightStruct.new(flight['actualarrivaltime'],
                                                    flight['actualdeparturetime'],
                                                    flight['aircrafttype'],
                                                    flight['destination'],
                                                    flight['destinationCity'],
                                                    flight['destinationName'],
                                                    flight['diverted'],
                                                    flight['estimatedarrivaltime'],
                                                    flight['filed_airspeed_kts'],
                                                    flight['filed_airspeed_mach'],
                                                    flight['filed_altitude'],
                                                    flight['filed_departuretime'],
                                                    flight['filed_ete'],
                                                    flight['filed_time'],
                                                    flight['ident'],
                                                    flight['origin'],
                                                    flight['originCity'],
                                                    flight['originName'],
                                                    flight['route']
                                                   )
    end
  end
end

class FlightInfoStruct
  attr_accessor :flights, :next_offset
  def initialize (flights = [], next_offset = nil)
    @flights = flights
    @next_offset = next_offset
  end
end

class FlightStruct
  attr_accessor :actualarrivaltime,
                :actualdeparturetime,
                :aircrafttype,
                :destination,
                :destinationCity,
                :destinationName,
                :diverted,
                :estimatedarrivaltime,
                :filed_airspeed_kts,
                :filed_airspeed_mach,
                :filed_altitude,
                :filed_departuretime,
                :filed_ete,
                :filed_time,
                :ident,
                :origin,
                :originCity,
                :originName,
                :route
                
  def initialize (actualarrivaltime = nil,
                  actualdeparturetime = nil,
                  aircrafttype = nil,
                  destination = nil,
                  destinationCity = nil,
                  destinationName = nil,
                  diverted = nil,
                  estimatedarrivaltime = nil,
                  filed_airspeed_kts = nil,
                  filed_airspeed_mach = nil,
                  filed_altitude = nil,
                  filed_departuretime = nil,
                  filed_ete = nil,
                  filed_time = nil,
                  ident = nil,
                  origin = nil,
                  originCity = nil,
                  originName = nil,
                  route = nil
                 )
    @actualarrivaltime = actualarrivaltime
    @actualdeparturetime = actualdeparturetime
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @diverted = diverted
    @estimatedarrivaltime = estimatedarrivaltime
    @filed_airspeed_kts = filed_airspeed_kts
    @filed_airspeed_mach = filed_airspeed_mach
    @filed_altitude = filed_altitude
    @filed_departuretime = filed_departuretime
    @filed_ete = filed_ete
    @filed_time = filed_time
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
    @route = route
  end
end


#FlightInfoEx
class FlightInfoExRequest
  attr_accessor :howMany, :ident, :offset
  def initialize(howMany = nil, ident = nil, offset = nil)
    @howMany = howMany
    @ident = ident
    @offset = offset
  end 
  def post
    "howMany=#@howMany&ident=#@ident&offset=#@offset"
  end
end

class FlightInfoExResults
  attr_accessor :flightInfoExResult
  def initialize(flightInfoExResult = nil)
    flightInfoExResult = JSON.parse(flightInfoExResult)['FlightInfoExResult']
    @flightInfoExResult = FlightInfoExStruct.new([], flightInfoExResult['next_offset'])
    flightInfoExResult['flights'].each do |flight|
      @flightInfoExResult.flights << FlightExStruct.new(flight['actualarrivaltime'],
                                                    flight['actualdeparturetime'],
                                                    flight['aircrafttype'],
                                                    flight['destination'],
                                                    flight['destinationCity'],
                                                    flight['destinationName'],
                                                    flight['diverted'],
                                                    flight['estimatedarrivaltime'],
                                                    flight['faFlightID'],
                                                    flight['filed_airspeed_kts'],
                                                    flight['filed_airspeed_mach'],
                                                    flight['filed_altitude'],
                                                    flight['filed_departuretime'],
                                                    flight['filed_ete'],
                                                    flight['filed_time'],
                                                    flight['ident'],
                                                    flight['origin'],
                                                    flight['originCity'],
                                                    flight['originName'],
                                                    flight['route']
                                                   )
    end
  end
end

class FlightInfoExStruct
  attr_accessor :flights, :next_offset
  def initialize (flights = [], next_offset = nil)
    @flights = flights
    @next_offset = next_offset
  end
end

class FlightExStruct
  attr_accessor :actualarrivaltime,
                :actualdeparturetime,
                :aircrafttype,
                :destination,
                :destinationCity,
                :destinationName,
                :diverted,
                :estimatedarrivaltime,
                :faFlightID,
                :filed_airspeed_kts,
                :filed_airspeed_mach,
                :filed_altitude,
                :filed_departuretime,
                :filed_ete,
                :filed_time,
                :ident,
                :origin,
                :originCity,
                :originName,
                :route
                
  def initialize (actualarrivaltime = nil,
                  actualdeparturetime = nil,
                  aircrafttype = nil,
                  destination = nil,
                  destinationCity = nil,
                  destinationName = nil,
                  diverted = nil,
                  estimatedarrivaltime = nil,
                  faFlightID = nil,
                  filed_airspeed_kts = nil,
                  filed_airspeed_mach = nil,
                  filed_altitude = nil,
                  filed_departuretime = nil,
                  filed_ete = nil,
                  filed_time = nil,
                  ident = nil,
                  origin = nil,
                  originCity = nil,
                  originName = nil,
                  route = nil
                 )
    @actualarrivaltime = actualarrivaltime
    @actualdeparturetime = actualdeparturetime
    @aircrafttype = aircrafttype
    @destination = destination
    @destinationCity = destinationCity
    @destinationName = destinationName
    @diverted = diverted
    @estimatedarrivaltime = estimatedarrivaltime
    @faFlightID = faFlightID
    @filed_airspeed_kts = filed_airspeed_kts
    @filed_airspeed_mach = filed_airspeed_mach
    @filed_altitude = filed_altitude
    @filed_departuretime = filed_departuretime
    @filed_ete = filed_ete
    @filed_time = filed_time
    @ident = ident
    @origin = origin
    @originCity = originCity
    @originName = originName
    @route = route
  end
end


#GetAlerts
class GetAlertsRequest
  def initialize()
  end 
  def post
    ""
  end
end

class GetAlertsResults
  attr_accessor :getAlertsResult
  def initialize(getAlertsResult = nil)
    getAlertsResult = JSON.parse(getAlertsResult)['GetAlertsResult']
    @getAlertsResult = FlightAlertListing.new([], getAlertsResult['next_offset'])
    getAlertsResult['alerts'].each do |alert|
      myAlert = FlightAlertEntry.new(alert['aircrafttype'],
                                     alert['alert_changed'],
                                     alert['alert_created'],
                                     alert['alert_id'],
                                     [],
                                     alert['date_end'],
                                     alert['date_start'],
                                     alert['description'],
                                     alert['destination'],
                                     alert['enabled'],
                                     alert['ident'],
                                     alert['origin'],
                                     alert['type'],
                                     alert['user_ident']
                                    )
      alert['channels'].each do |channel|
        myAlert.channels << FlightAlertChannel.new(channel['channel_id'],
                                          channel['channel_name'],
                                          channel['e_arrival'],
                                          channel['e_cancelled'],
                                          channel['e_departure'],
                                          channel['e_diverted'],
                                          channel['e_filed'],
                                          channel['mask_summary'],
                                          channel['target_address']
                                         )
      end
      @getAlertsResult.alerts << myAlert
    end
  end
end

class FlightAlertListing
  attr_accessor :alerts, :num_alerts
  def initialize (alerts = [], num_alerts = nil)
    @alerts = alerts
    @num_alerts = num_alerts
  end
end

class FlightAlertEntry
  attr_accessor :aircrafttype,
                :alert_changed,
                :alert_created,
                :alert_id,
                :channels,
                :date_end,
                :date_start,
                :description,
                :destination,
                :enabled,
                :ident,
                :origin,
                :type,
                :user_ident
                
  def initialize (aircrafttype = nil,
                  alert_changed = nil,
                  alert_created = nil,
                  alert_id = nil,
                  channels = [],
                  date_end = nil,
                  date_start = nil,
                  description = nil,
                  destination = nil,
                  enabled = nil,
                  ident = nil,
                  origin = nil,
                  type = nil,
                  user_ident = nil
                 )
    @aircrafttype = aircrafttype
    @alert_changed = alert_changed
    @alert_created = alert_created
    @alert_id = alert_id
    @channels = channels
    @date_end = date_end
    @date_start = date_start
    @description = description
    @destination = destination
    @enabled = enabled
    @ident = ident
    @origin = origin
    @type = type
    @user_ident = user_ident
  end
end

class FlightAlertChannel
  attr_accessor :channel_id, :channel_name, :e_arrival, :e_cancelled, :e_departure, :e_diverted, :e_filed, :mask_summary, :target_address
  def initialize(channel_id = nil, channel_name = nil, e_arrival = nil, e_cancelled = nil, e_departure = nil, e_diverted = nil, e_filed = nil, mask_summary = nil, target_address = nil)
    @channel_id = channel_id
    @channel_name = channel_name
    @e_arrival = e_arrival
    @e_cancelled = e_cancelled
    @e_departure = e_departure
    @e_diverted = e_diverted
    @e_filed = e_filed
    @mask_summary = mask_summary
    @target_address = target_address
  end
end


#GetFlightID
class GetFlightIDRequest
  attr_accessor :departureTime, :ident 
  def initialize(departureTime = nil, ident = nil)
    @departureTime = departureTime
    @ident = ident
  end 
  def post
    "departureTime=#@departureTime&ident=#@ident"
  end
end

class GetFlightIDResults
  attr_accessor :getFlightIDResult
  def initialize(getFlightIDResult = nil)
    getFlightIDResult = JSON.parse(getFlightIDResult)['GetFlightIDResult']
    @getFlightIDResult = getFlightIDResult
  end
end


#GetHistoricalTrack
class GetHistoricalTrackRequest
  attr_accessor :faFlightID
  def initialize(faFlightID = nil)
    @faFlightID = faFlightID
  end 
  def post
    "faFlightID=#@faFlightID"
  end
end

class GetHistoricalTrackResults
  attr_accessor :getHistoricalTrackResult
  def initialize(getHistoricalTrackResult = nil)
    getHistoricalTrackResult = JSON.parse(getHistoricalTrackResult)['GetHistoricalTrackResult']
    @getHistoricalTrackResult = ArrayOfTrackStruct.new()
    getHistoricalTrackResult['data'].each do |data|
      @getHistoricalTrackResult.data << TrackStruct.new(data['altitude'],
                                     data['altitudeChange'],
                                     data['altitudeStatus'],
                                     data['groundsped'],
                                     data['latitude'],
                                     data['longitude'],
                                     data['timestamp'],
                                     data['updateType']
                                    )

    end
  end
end

class ArrayOfTrackStruct
  attr_accessor :data
  def initialize (data = [])
    @data = data
  end
end

class TrackStruct
  attr_accessor :altitude,
                :altitudeChange,
                :altitudeStatus,
                :groundspeed,
                :latitude,
                :longitude,
                :timestamp,
                :updateType
                
  def initialize (altitude = nil,
                  altitudeChange = nil,
                  altitudeStatus = nil,
                  groundspeed = nil,
                  latitude = nil,
                  longitude = nil,
                  timestamp = nil,
                  updateType = nil
                 )
    @altitude = altitude
    @altitudeChange = altitudeChange
    @altitudeStatus = altitudeStatus
    @groundspeed = groundspeed
    @latitude = latitude
    @longitude = longitude
    @timestamp = timestamp
    @updateType = updateType
  end
end


#GetLastTrack
class GetLastTrackRequest
  attr_accessor :ident
  def initialize(ident = nil)
    @ident = ident
  end 
  def post
    "ident=#@ident"
  end
end

class GetLastTrackResults
  attr_accessor :getLastTrackResult
  def initialize(getLastTrackResult = nil)
    getLastTrackResult = JSON.parse(getLastTrackResult)['GetLastTrackResult']
    @getLastTrackResult = ArrayOfTrackStruct.new()
    getLastTrackResult['data'].each do |data|
      @getLastTrackResult.data << TrackStruct.new(data['altitude'],
                                     data['altitudeChange'],
                                     data['altitudeStatus'],
                                     data['groundsped'],
                                     data['latitude'],
                                     data['longitude'],
                                     data['timestamp'],
                                     data['updateType']
                                    )

    end
  end
end


#InboundFlightInfo
class InboundFlightInfoRequest
  attr_accessor :faFlightID
  def initialize(faFlightID = nil)
    @faFlightID = faFlightID
  end 
  def post
    "faFlightID=#@faFlightID"
  end
end

class InboundFlightInfoResults
  attr_accessor :inboundFlightInfoResult
  def initialize(inboundFlightInfoResult = nil)
    inboundFlightInfoResult = JSON.parse(inboundFlightInfoResult)['InboundFlightInfoResult']
    @inboundFlightInfoResult = FlightExStruct.new(inboundFlightInfoResult['actualarrivaltime'],
                                                  inboundFlightInfoResult['actualdeparturetime'],
                                                  inboundFlightInfoResult['aircrafttype'],
                                                  inboundFlightInfoResult['destination'],
                                                  inboundFlightInfoResult['destinationCity'],
                                                  inboundFlightInfoResult['destinationName'],
                                                  inboundFlightInfoResult['diverted'],
                                                  inboundFlightInfoResult['estimatedarrivaltime'],
                                                  inboundFlightInfoResult['faFlightID'],
                                                  inboundFlightInfoResult['filed_airspeed_kts'],
                                                  inboundFlightInfoResult['filed_airspeed_mach'],
                                                  inboundFlightInfoResult['filed_altitude'],
                                                  inboundFlightInfoResult['filed_departuretime'],
                                                  inboundFlightInfoResult['filed_ete'],
                                                  inboundFlightInfoResult['filed_time'],
                                                  inboundFlightInfoResult['ident'],
                                                  inboundFlightInfoResult['origin'],
                                                  inboundFlightInfoResult['originCity'],
                                                  inboundFlightInfoResult['originName'],
                                                  inboundFlightInfoResult['route']
                                                 )
  end
end