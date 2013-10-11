#Error
class FlightAwareError
  attr_accessor :error
  def initialize(error = nil)
    @error = error
  end
end

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
    begin
      rawAircraftTypeResult = JSON.parse(aircraftTypeResult)
      aircraftTypeResult = JSON.parse(aircraftTypeResult)['AircraftTypeResult']
      @aircraftTypeResult = AircraftTypeStruct.new(aircraftTypeResult['description'], aircraftTypeResult['manufacturer'], aircraftTypeResult['type'])
    rescue
        raise FlightAwareError.new(rawAircraftTypeResult['error']).error
    end
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
    begin
      rawAirlineFlightInfoResult = JSON.parse(airlineFlightInfoResult)
      airlineFlightInfoResult = rawAirlineFlightInfoResult['AirlineFlightInfoResult']
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
    rescue
        raise FlightAwareError.new(rawAirlineFlightInfoResult['error']).error
    end
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
    begin
      rawAirlineFlightSchedulesResult = JSON.parse(airlineFlightSchedulesResult)
      airlineFlightSchedulesResult = rawAirlineFlightSchedulesResult['AirlineFlightSchedulesResult']
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
    rescue
        raise FlightAwareError.new(rawAirlineFlightSchedulesResult['error']).error
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
    begin
      rawAirlineInfoResult = JSON.parse(airlineInfoResult)
      airlineInfoResult = rawAirlineInfoResult['AirlineInfoResult']
      @airlineInfoResult = AirlineInfoStruct.new(airlineInfoResult['callsign'],
                                                 airlineInfoResult['country'],
                                                 airlineInfoResult['location'],
                                                 airlineInfoResult['name'],
                                                 airlineInfoResult['phone'],
                                                 airlineInfoResult['shortname'],
                                                 airlineInfoResult['url']
                                                )
    rescue
        raise FlightAwareError.new(rawAirlineInfoResult['error']).error
    end
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
    begin
      rawAirlineInsightResult = JSON.parse(airlineInsightResult)
      airlineInsightResult = rawAirlineInsightResult['AirlineInsightResult']
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
    rescue
        raise FlightAwareError.new(rawInboundFlightInfoResult['error']).error
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
    begin
    rawAirportInfoResult = JSON.parse(airportInfoResult)
    airportInfoResult = rawAirportInfoResult['AirportInfoResult']
    @airportInfoResult = AirportInfoStruct.new(airportInfoResult['latitude'], 
                                                airportInfoResult['location'],
                                                airportInfoResult['longitude'],
                                                airportInfoResult['name'],
                                                airportInfoResult['timezone'],   
                                                )
    rescue
        raise FlightAwareError.new(rawAirportInfoResult['error']).error
    end
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
    begin
      rawAllAirlinesResult = JSON.parse(allAirlinesResult)
      allAirlinesResult = rawAllAirlinesResult['AllAirlinesResult']
      @allAirlinesResult = ArrayOfString.new()
      allAirlinesResult['data'].each do |data|
        @allAirlinesResult.data << data
      end
    rescue
        raise FlightAwareError.new(rawAllAirlinesResult['error']).error
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
    begin
      rawAllAirportsResult = JSON.parse(allAirportsResult)
      allAirportsResult = rawAllAirportsResult['AllAirportsResult']
      @allAirportsResult = ArrayOfString.new()
      allAirportsResult['data'].each do |data|
        @allAirportsResult.data << data
      end
    rescue
        raise FlightAwareError.new(rawAllAirportsResult['error']).error
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
    begin
      rawArrivedResult = JSON.parse(arrivedResult)
      arrivedResult = rawArrivedResult['ArrivedResult']
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
    rescue
        raise FlightAwareError.new(rawArrivedResult['error']).error
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
    begin
      rawBlockIdentCheckResult = JSON.parse(blockIdentCheckResult)
      blockIdentCheckResult = rawBlockIdentCheckResult['BlockIdentCheckResult']
      @blockIdentCheckResult = blockIdentCheckResult
    rescue
        raise FlightAwareError.new(rawBlockIdentCheckResult['error']).error
    end
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
    begin
      rawCountAirportOperationsResult = JSON.parse(countAirportOperationsResult)
      countAirportOperationsResult = rawCountAirportOperationsResult['CountAirportOperationsResult']
      @countAirportOperationsResult = CountAirportOperationsStruct.new(countAirportOperationsResult['departed'], 
                                                             countAirportOperationsResult['enroute'], 
                                                             countAirportOperationsResult['scheduled_arrivals'],
                                                             countAirportOperationsResult['scheduled_departures']
                                                            )
    rescue
        raise FlightAwareError.new(rawCountAirportOperatonsResult['error']).error
    end
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
    begin
      rawDecodeFlightRouteResult = JSON.parse(decodeFlightRouteResult)
      decodeFlightRouteResult= rawDecodeFlightRouteResult['DecodeFlightRouteResult']
      @decodeFlightRouteResult  = ArrayOfFlightRouteStruct.new([],decodeFlightRouteResult['next_offset'])
      decodeFlightRouteResult['data'].each do |data|
        @decodeFlightRouteResult.data << FlightRouteStruct.new(data['latitude'],
                                                               data['longitude'],
                                                               data['name'],
                                                               data['type']
                                                              )
      end
    rescue
        raise FlightAwareError.new(rawDecodeFlightRouteResult['error']).error
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
    begin
      rawDecodeRouteResult = JSON.parse(decodeRouteResult)
      decodeRouteResult = rawDecodeRouteResult['DecodeRouteResult']
      @decodeRouteResult  = ArrayOfFlightRouteStruct.new([],decodeRouteResult['next_offset'])
      decodeRouteResult['data'].each do |data|
        @decodeRouteResult.data << FlightRouteStruct.new(data['latitude'],
                                                         data['longitude'],
                                                         data['name'],
                                                         data['type']
                                                        )
      end
    rescue
        raise FlightAwareError.new(rawDecodeRouteResult['error']).error
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
    begin
      rawDeleteAlertResult = JSON.parse(deleteAlertResult)
      deleteAlertResult = rawDeleteAlertResult['DeleteAlertResult']
      @deleteAlertResult = deleteAlertResult
    rescue
        raise FlightAwareError.new(rawDeleteAlertResult['error']).error
    end
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
    begin
      rawDepartedResult = JSON.parse(departedResult)
      departedResult = rawDepartedResult['DepartedResult']
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
    rescue
        raise FlightAwareError.new(rawDepartedResult['error']).error
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
    begin
      rawEnrouteResult = JSON.parse(enrouteResult)
      enrouteResult = rawEnrouteResult['EnrouteResult']
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
    rescue
        raise FlightAwareError.new(rawEnrouteResult['error']).error
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
    begin
      rawFleetArrivedResult = JSON.parse(fleetArrivedResult)
      fleetArrivedResult = rawFleetArrivedResult['FleetArrivedResult']
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
    rescue
        raise FlightAwareError.new(rawFleetArrivedResult['error']).error
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
    begin
      rawFleetScheduledResult = JSON.parse(fleetScheduledResult)
      fleetScheduledResult = rawFleetScheduledResult['FleetScheduledResult']
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
    rescue
        raise FlightAwareError.new(rawFleetScheduledResult['error']).error
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
    begin
      rawFlightInfoResult = JSON.parse(flightInfoResult)
      flightInfoResult = rawFlightInfoResult['FlightInfoResult']
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
    rescue
        raise FlightAwareError.new(rawFlightInfoResult['error']).error
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
    begin
      rawFlightInfoResult = JSON.parse(flightInfoExResult)
      flightInfoExResult = rawFlightInfoResult['FlightInfoExResult']
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
    rescue
        raise FlightAwareError.new(rawFlightInfoResult['error']).error
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
    begin
      rawGetAlertsResult = JSON.parse(getAlertsResult)
      getAlertsResult = rawGetAlertsResult['GetAlertsResult']
      @getAlertsResult = FlightAlertListing.new([], getAlertsResult['num_alerts'])
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
    rescue
        raise FlightAwareError.new(rawGetAlertsResult['error']).error
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
    begin
      rawGetFlightIDResult = JSON.parse(getFlightIDResult)
      getFlightIDResult = rawGetFlightIDResult['GetFlightIDResult']
      @getFlightIDResult = getFlightIDResult
    rescue
        raise FlightAwareError.new(rawGetFlightIDResult['error']).error
    end
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
    begin
      rawGetHistoricalTrackResult = JSON.parse(getHistoricalTrackResult)
      getHistoricalTrackResult = rawGetHistoricalTrackResult['GetHistoricalTrackResult']
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
    rescue
        raise FlightAwareError.new(rawGetHistoricalTrackResult['error']).error
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
    begin
      rawGetLastTrackResult = JSON.parse(getLastTrackResult)
      getLastTrackResult = rawGetLastTrackResult['GetLastTrackResult']
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
    rescue
        raise FlightAwareError.new(rawGetLastTrackResult['error']).error
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
    begin
      rawInboundFlightInfoResult = JSON.parse(inboundFlightInfoResult)
      inboundFlightInfoResult = rawInboundFlightInforResult['InboundFlightInfoResult']
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
    rescue
        raise FlightAwareError.new(rawInboundFlightInfoResult['error']).error
    end
  end
end


#InFlightInfo
class InFlightInfoRequest
  attr_accessor :ident
  def initialize(ident = nil)
    @ident = ident
  end 
  def post
    "ident=#@ident"
  end
end

class InFlightInfoResults
  attr_accessor :inFlightInfoResult
  def initialize(inFlightInfoResult = nil)
    begin
      rawInFlightInfoResult = JSON.parse(inFlightInfoResult)
      inFlightInfoResult = rawInFlightInfoResult['InFlightInfoResult']
      @inFlightInfoResult = InFlightAircraftStruct.new(inFlightInfoResult['altitude'],
                                                       inFlightInfoResult['altitudeChange'],
                                                       inFlightInfoResult['altitudeStatus'],
                                                       inFlightInfoResult['departureTime'],
                                                       inFlightInfoResult['destination'],
                                                       inFlightInfoResult['faFlightID'],
                                                       inFlightInfoResult['firstPositionTime'],
                                                       inFlightInfoResult['groundspeed'],
                                                       inFlightInfoResult['heading'],
                                                       inFlightInfoResult['highLatitude'],
                                                       inFlightInfoResult['highLongitude'],
                                                       inFlightInfoResult['ident'],
                                                       inFlightInfoResult['latitude'],
                                                       inFlightInfoResult['longitude'],
                                                       inFlightInfoResult['lowLatitude'],
                                                       inFlightInfoResult['lowLongitude'],
                                                       inFlightInfoResult['origin'],
                                                       inFlightInfoResult['prefix'],
                                                       inFlightInfoResult['suffix'],
                                                       inFlightInfoResult['timeout'],
                                                       inFlightInfoResult['timestamp'],
                                                       inFlightInfoResult['type'],
                                                       inFlightInfoResult['updateType'],
                                                       inFlightInfoResult['waypoints']
                                                      )
    rescue
        raise FlightAwareError.new(rawInFlightInfoResult['error']).error
    end
  end
end

class InFlightAircraftStruct
  attr_accessor :altitude,
                :altitudeChange,
                :altitudeStatus,
                :departureTime,
                :destination,
                :faFlightID,
                :firstPositionTime,
                :groundspeed,
                :heading,
                :highLatitude,
                :highLongitude,
                :ident,
                :latitude,
                :longitude,
                :lowLatitude,
                :lowLongitude,
                :origin,
                :prefix,
                :suffix,
                :timeout,
                :timestamp,
                :type,
                :updateType,
                :waypoints
                
  def initialize (altitude = nil,
                  altitudeChange = nil,
                  altitudeStatus = nil,
                  departureTime = nil,
                  destination = nil,
                  faFlightID = nil,
                  firstPositionTime = nil,
                  groundspeed = nil,
                  heading = nil,
                  highLatitude = nil,
                  highLongitude = nil,
                  ident = nil,
                  latitude = nil,
                  longitude = nil,
                  lowLatitude = nil,
                  lowLongitude = nil,
                  origin = nil,
                  prefix = nil,
                  suffix = nil,
                  timeout = nil,
                  timestamp = nil,
                  type = nil,
                  updateType = nil,
                  waypoints = nil
                 )
    @altitude = altitude
    @altitudeChange = altitudeChange
    @altitudeStatus = altitudeStatus
    @departureTime = departureTime
    @destination = destination
    @faFlightID = faFlightID
    @firstPositionTime = firstPositionTime
    @groundspeed = groundspeed
    @heading = heading
    @highLatitude = highLatitude
    @highLongitude = highLongitude
    @ident = ident
    @latitude = latitude
    @longitude = longitude
    @lowLatitude = lowLatitude
    @lowLongitude = lowLongitude
    @origin = origin
    @prefix = prefix
    @suffix = suffix
    @timeout = timeout
    @timestamp = timestamp
    @type = type
    @updateType = updateType
    @waypoints = waypoints
  end
end


#LatLongsToDistance
class LatLongsToDistanceRequest
  attr_accessor :lat1, :lat2, :lon1, :lon2
  def initialize(lat1 = nil, lat2 = nil, lon1 = nil, lon2 = nil)
    @lat1 = lat1
    @lat2 = lat2
    @lon1 = lon1
    @lon2 = lon2
  end 
  def post
    "lat1=#@lat1&lat2=#@lat2&lon1=#@lon1&lon2=#@lon2"
  end
end

class LatLongsToDistanceResults
  attr_accessor :latLongsToDistanceResult
  def initialize(latLongsToDistanceResult = nil)
    begin
      rawLatLongsToDistanceResult = JSON.parse(latLongsToDistanceResult)
      latLongsToDistanceResult = rawLatLongsToDistance['LatLongsToDistanceResult']
      @latLongsToDistanceResult = latLongsToDistanceResult
    rescue
        raise FlightAwareError.new(rawLatLongsToDistanceResult['error']).error
    end
  end
end


#LatLongsToHeading
class LatLongsToHeadingRequest
  attr_accessor :lat1, :lat2, :lon1, :lon2
  def initialize(lat1 = nil, lat2 = nil, lon1 = nil, lon2 = nil)
    @lat1 = lat1
    @lat2 = lat2
    @lon1 = lon1
    @lon2 = lon2
  end 
  def post
    "lat1=#@lat1&lat2=#@lat2&lon1=#@lon1&lon2=#@lon2"
  end
end

class LatLongsToHeadingResults
  attr_accessor :latLongsToHeadingResult
  def initialize(latLongsToHeadingResult = nil)
    begin
      rawLatLongsToHeadingResult = JSON.parse(latLongsToHeadingResult)
      latLongsToHeadingResult = rawLatLongsToHeadingResult['LatLongsToHeadingResult']
      @latLongsToHeadingResult = latLongsToHeadingResult
    rescue
        raise FlightAwareError.new(rawLatLongsToHeadingResult['error']).error
    end
  end
end


#MapFlight
class MapFlightRequest
  attr_accessor :ident, :mapHeight, :mapWidth
  def initialize(ident = nil, mapHeight = nil, mapWidth = nil)
    @ident = ident
    @mapHeight = mapHeight
    @mapWidth = mapWidth
  end 
  def post
    "ident=#@ident&mapHeight=#@mapHeight&mapWidth=#@mapWidth"
  end
end

class MapFlightResults
  attr_accessor :mapFlightResult
  def initialize(mapFlightResult = nil)
    begin
      rawMapFlightResult = JSON.parse(mapFlightResult)
      mapFlightResult = rawMapFlightResult['MapFlightResult']
      @mapFlightResult = mapFlightResult
    rescue
        raise FlightAwareError.new(rawMapFlightResult['error']).error
    end
  end
end


#MapFlightEx
class MapFlightExRequest
  attr_accessor :airports_expand_view, 
                :faFlightID, 
                :latlon_box, 
                :layer_off, 
                :layer_on, 
                :mapHeight, 
                :mapWidth, 
                :show_airports, 
                :show_data_blocks
                
  def initialize(airports_expand_view = nil, 
                 faFlightID = nil, 
                 latlon_box = [], 
                 layer_off = [], 
                 layer_on = [], 
                 mapHeight = nil, 
                 mapWidth = nil, 
                 show_airports = nil, 
                 show_data_blocks = nil)
    @airports_expand_view = airports_expand_view
    @faFlightID = faFlightID
    @latlon_box = latlon_box
    @layer_off = layer_off
    @layer_on = layer_on
    @mapHeight = mapHeight
    @mapWidth = mapWidth
    @show_airports = show_airports
    @show_data_blocks = show_data_blocks
  end 
  def post
    #TODO Clean this up when the Rest-Client properly handles arrays
    latlon_box = ""
    @latlon_box.each { |v| latlon_box = latlon_box + "latlon_box=" + v.to_s + "&" }
    @latlon_box = latlon_box
    
    layer_on = ""
    @layer_on.each { |v| layer_on = layer_on + "layer_on=" + v.to_s + "&" }
    @layer_on = layer_on
    
    layer_off = ""
    @layer_off.each { |v| layer_off = layer_off + "layer_off=" + v.to_s + "&" }
    @layer_off = layer_off
    
    output = "airports_expand_view=#@airports_expand_view&faFlightID=#@faFlightID&#{@latlon_box}#{@layer_off}#{@layer_on}" +
    "mapHeight=#@mapHeight&mapWidth=#@mapWidth&show_airports=#@show_airports&show_data_blocks=#@show_data_blocks"
    output
  end
end

class MapFlightExResults
  attr_accessor :mapFlightExResult
  def initialize(mapFlightExResult = nil)
    begin
      rawMapFlightExResult = JSON.parse(mapFlightExResult)
      mapFlightExResult = rawMapFlightExResult['MapFlightExResult']
      @mapFlightExResult = mapFlightExResult
    rescue
        raise FlightAwareError.new(rawMapFlightExResult['error']).error
    end
  end
end


#Metar
class MetarRequest
  attr_accessor :airport
  def initialize(airport = nil)
    @airport = airport
  end 
  def post
    "airport=#@airport"
  end
end

class MetarResults
  attr_accessor :metarResult
  def initialize(metarResult = nil)
    begin
      rawMetarResult = JSON.parse(metarResult)
      metarResult = rawMetarResult['MetarResult']
      @metarResult = metarResult
    rescue
        raise FlightAwareError.new(rawMetarResult['error']).error
    end
  end
end


#MetarEx
class MetarExRequest
  attr_accessor :airport, :startTime, :howMany, :offset
  def initialize(airport = nil, startTime = nil, howMany = nil, offset = nil)
    @airport = airport
    @startTime = startTime
    @howMany = howMany
    @offset = offset
  end 
  def post
    "airport=#@airport&startTime=#@startTime&howMany=#@howMany&offset=#@offset"
  end
end

class MetarExResults
  attr_accessor :metarExResult
  def initialize(metarExResult = nil)
    begin
      rawMetarExResult = JSON.parse(metarExResult)
      metarExResult = rawMetarExResult['MetarExResult']
      @metarExResult = ArrayOfMetarStruct.new([], metarExResult['next_offset'])
      metarExResult['metar'].each do |metar|
        @metarExResult.metar << MetarStruct.new(metar['airport'],
                                                metar['cloud_altitude'],
                                                metar['cloud_friendly'],
                                                metar['cloud_type'],
                                                metar['conditions'],
                                                metar['pressure'],
                                                metar['raw_data'],
                                                metar['temp_air'],
                                                metar['temp_dewpoint'],
                                                metar['temp_relhum'],
                                                metar['time'],
                                                metar['visibility'],
                                                metar['wind_direction'],
                                                metar['wind_friendly'],
                                                metar['wind_speed'],
                                                metar['wind_speed_gust']
                                               )
  
      end
    rescue
        raise FlightAwareError.new(rawMetarExResult['error']).error
    end
  end
end

class ArrayOfMetarStruct
  attr_accessor :metar, :next_offset
  def initialize(metar = [], next_offset = nil)
    @metar = metar
    @next_offset = next_offset
  end
end


class MetarStruct
  attr_accessor :airport,
                :cloud_altitude,
                :cloud_friendly,
                :cloud_type,
                :conditions,
                :pressure,
                :raw_data,
                :temp_air,
                :temp_dewpoint,
                :temp_relhum,
                :time,
                :visibility,
                :wind_direction,
                :wind_friendly,
                :wind_speed,
                :wind_speed_gust

  def initialize(airport = nil,
                 cloud_altitude = nil,
                 cloud_friendly = nil,
                 cloud_type = nil,
                 conditions = nil,
                 pressure = nil,
                 raw_data = nil,
                 temp_air = nil,
                 temp_dewpoint = nil,
                 temp_relhum = nil,
                 time = nil,
                 visibility = nil,
                 wind_direction = nil,
                 wind_friendly = nil,
                 wind_speed = nil,
                 wind_speed_gust = nil
                )
    @airport = airport
    @cloud_altitude = cloud_altitude
    @cloud_friendly = cloud_friendly
    @cloud_type = cloud_type
    @conditions = conditions
    @pressure = pressure
    @raw_data = raw_data
    @temp_air = temp_air
    @temp_dewpoint = temp_dewpoint
    @temp_relhum = temp_relhum
    @time = time
    @visibility = visibility
    @wind_direction = wind_direction
    @wind_friendly = wind_friendly
    @wind_speed = wind_speed
    @wind_speed_gust = wind_speed_gust
  end
end


#NTaf
class NTafRequest
  attr_accessor :airport
  def initialize(airport = nil)
    @airport = airport
  end 
  def post
    "airport=#@airport"
  end
end

class NTafResults
  attr_accessor :nTafResult
  def initialize(nTafResult = nil)
    begin
      rawNTafResult = JSON.parse(nTafResult)
      nTafResult = JSON.parse(nTafResult)['NTafResult']
      @nTafResult = TafStruct.new(nTafResult['airport'],
                                  nTafResult['forecast'].each { |v| v},
                                  nTafResult['timeString']
                                 )
    rescue
        raise FlightAwareError.new(rawNTafResultResult['error']).error
    end
  end
end

class TafStruct
  attr_accessor :airport, :forecast, :timeString
  def initialize(airport = nil, forecast = [], timeString = nil)
    @airport = airport
    @forecast = forecast
    @timeString = timeString
  end
end


#RegisterAlertEndpoint
class RegisterAlertEndpointRequest
  attr_accessor :address, :format_type
  def initialize(address = nil, format_type = "json/post")
    @address = address
    @format_type = format_type
  end 
  def post
    "address=#@address&format_type=#@format_type"
  end
end

class RegisterAlertEndpointResults
  attr_accessor :registerAlertEndpointResult
  def initialize(registerAlertEndpointResult = nil)
    begin
      rawRegisterAlertEndpointResult = JSON.parse(registerAlertEndpointResult)
      registerAlertEndpointResult = rawRegisterAlertEndpointResult['RegisterAlertEndpointResult']
      @registerAlertEndpointResult = registerAlertEndpointResult
    rescue
        raise FlightAwareError.new(rawRegisterAlertEndpointResult['error']).error
    end
  end
end


#RoutesBetweenAirports
class RoutesBetweenAirportsRequest
  attr_accessor :destination, :origin
  def initialize(destination = nil, origin = nil)
    @destination = destination
    @origin = origin
  end 
  def post
    "destination=#@destination&origin=#@origin"
  end
end

class RoutesBetweenAirportsResults
  attr_accessor :routesBetweenAirportsResult
  def initialize(routesBetweenAirportsResult = nil)
    begin
      rawRoutesBetweenAirportsResult = JSON.parse(routesBetweenAirportsResult)
      routesBetweenAirportsResult = rawRoutesBetweenAirportsResult['RoutesBetweenAirportsResult']
      @routesBetweenAirportsResult = ArrayOfRoutesBetweenAirportsStruct.new()
      routesBetweenAirportsResult['data'].each do |route|
        @routesBetweenAirportsResult.data << RoutesBetweenAirportsStruct.new(route['count'],
                                                                              route['filedAltitude'],
                                                                              route['route']
                                                                             )
  
      end
    rescue
        raise FlightAwareError.new(rawRoutesBetwenAirportsResult['error']).error
    end
  end
end

class ArrayOfRoutesBetweenAirportsStruct
  attr_accessor :data
  def initialize(data = [])
    @data = data
  end
end


class RoutesBetweenAirportsStruct
  attr_accessor :count, :filedAltitude, :route
  def initialize(count = nil, filedAltitude = nil, route = nil)
    @count = count
    @filedAltitude = filedAltitude
    @route = route
  end
end


#RoutesBetweenAirportsEx
class RoutesBetweenAirportsExRequest
  attr_accessor :destination, :howMany, :maxDepartureAge, :maxFileAge, :offset, :origin
  def initialize(destination = nil, howMany = nil, maxDepartureAge = nil, maxFileAge = nil, offset = nil, origin = nil)
    @destination = destination
    @howMany = howMany
    @maxDepartureAge = maxDepartureAge
    @maxFileAge = maxFileAge
    @offset = offset
    @origin = origin
  end 
  def post
    "destination=#@destination&howMany=#@howMany&maxDepartureAge=#@maxDepartureAge&maxFileAge=#@maxFileAge&offset=#@offset&origin=#@origin"
  end
end

class RoutesBetweenAirportsExResults
  attr_accessor :routesBetweenAirportsExResult
  def initialize(routesBetweenAirportsExResult = nil)
    begin
      rawRoutesBetweenAirportsExResult = JSON.parse(routesBetwenAirportsExResult)
      routesBetweenAirportsExResult = rawRoutesBetweenAirportsExResult['RoutesBetweenAirportsExResult']
      @routesBetweenAirportsExResult = ArrayOfRoutesBetweenAirportsExStruct.new([], routesBetweenAirportsExResult['next_offset'])
      routesBetweenAirportsExResult['data'].each do |route|
        @routesBetweenAirportsExResult.data << RoutesBetweenAirportsExStruct.new(route['count'],
                                                                                 route['filedAltitude_max'],
                                                                                 route['filedAltitude_min'],
                                                                                 route['last_departuretime'],
                                                                                 route['route']
                                                                                )
  
      end
    rescue
        raise FlightAwareError.new(rawRoutesBetweenAirportsExResult['error']).error
    end
  end
end

class ArrayOfRoutesBetweenAirportsExStruct
  attr_accessor :data, :next_offset
  def initialize(data = [], next_offset = nil)
    @data = data
    @next_offset = next_offset
  end
end


class RoutesBetweenAirportsExStruct
  attr_accessor :count, :filedAltitude_max, :filedAltitude_min, :last_departuretime, :route
  def initialize(count = nil, filedAltitude_max = nil, filedAltitude_min = nil, last_departuretime = nil, route = nil)
    @count = count
    @filedAltitude_max = filedAltitude_max
    @filedAltitude_min = filedAltitude_min
    @last_departuretime = last_departuretime
    @route = route
  end
end


#Scheduled
class ScheduledRequest
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

class ScheduledResults
  attr_accessor :scheduledResult
  def initialize(scheduledResult = nil)
    begin
      rawScheduledResult = JSON.parse(scheduledresult)
      scheduledResult = rawScheduledResult['ScheduledResult']
      @scheduledResult = ScheduledStruct.new(scheduledResult['next_offset'], [])
      scheduledResult['scheduled'].each do |scheduled|
        @scheduledResult.scheduled << ScheduledFlightStruct.new(scheduled['aircrafttype'],
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
    rescue
        raise FlightAwareError.new(rawScheduledResult['error']).error
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

class ArrivalFlightStruct
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


#Search
class SearchRequest
  attr_accessor :howMany, :offset, :query 
  def initialize(howMany = nil, offset = nil, query = nil)
    @howMany = howMany
    @offset = offset
    @query = query
  end 
  def post
    "howMany=#@howMany&offset=#@offset&query=#@query"
  end
end

class SearchResults
  attr_accessor :searchResult
  def initialize(searchResult = nil)
    begin
      rawSearchResult = JSON.parse(searchResult)
      searchResult = rawSearchResult['SearchResult']
      @searchResult = InFlightStruct.new([], searchResult['next_offset'])
      searchResult['aircraft'].each do |aircraft|
        @searchResult.aircraft << InFlightAircraftStruct.new(aircraft['altitude'],
                                                       aircraft['altitudeChange'],
                                                       aircraft['altitudeStatus'],
                                                       aircraft['departureTime'],
                                                       aircraft['destination'],
                                                       aircraft['faFlightID'],
                                                       aircraft['firstPositionTime'],
                                                       aircraft['groundspeed'],
                                                       aircraft['heading'],
                                                       aircraft['highLatitude'],
                                                       aircraft['highLongitude'],
                                                       aircraft['ident'],
                                                       aircraft['latitude'],
                                                       aircraft['longitude'],
                                                       aircraft['lowLatitude'],
                                                       aircraft['lowLongitude'],
                                                       aircraft['origin'],
                                                       aircraft['prefix'],
                                                       aircraft['suffix'],
                                                       aircraft['timeout'],
                                                       aircraft['timestamp'],
                                                       aircraft['type'],
                                                       aircraft['updateType'],
                                                       aircraft['waypoints']
                                                      )
      end
    rescue
        raise FlightAwareError.new(rawSearchResult['error']).error
    end
  end
end

class InFlightStruct
  attr_accessor :aircraft, :next_offset
  def initialize(aircraft = [], next_offset = nil)
    @aircraft = aircraft
    @next_offset = next_offset
  end
end


#SearchBirdseyeInFlight
class SearchBirdseyeInFlightRequest
  attr_accessor :howMany, :offset, :query 
  def initialize(howMany = nil, offset = nil, query = nil)
    @howMany = howMany
    @offset = offset
    @query = query
  end 
  def post
    "howMany=#@howMany&offset=#@offset&query=#@query"
  end
end

class SearchBirdseyeInFlightResults
  attr_accessor :searchBirdseyeInFlightResult
  def initialize(searchBirdseyeInFlightResult = nil)
    begin
      rawSearchBirdseyeInFlightResult = JSON.parse(searchBirdseyeInFlightResult)
      searchBirdseyeInFlightResult = rawSearchBirdseyeInFlightResult['SearchBirdseyeInFlightResult']
      @searchBirdseyeInFlightResult = InFlightStruct.new([], searchBirdseyeInFlightResult['next_offset'])
      searchBirdseyeInFlightResult['aircraft'].each do |aircraft|
        @searchBirdseyeInFlightResult.aircraft << InFlightAircraftStruct.new(aircraft['altitude'],
                                                                             aircraft['altitudeChange'],
                                                                             aircraft['altitudeStatus'],
                                                                             aircraft['departureTime'],
                                                                             aircraft['destination'],
                                                                             aircraft['faFlightID'],
                                                                             aircraft['firstPositionTime'],
                                                                             aircraft['groundspeed'],
                                                                             aircraft['heading'],
                                                                             aircraft['highLatitude'],
                                                                             aircraft['highLongitude'],
                                                                             aircraft['ident'],
                                                                             aircraft['latitude'],
                                                                             aircraft['longitude'],
                                                                             aircraft['lowLatitude'],
                                                                             aircraft['lowLongitude'],
                                                                             aircraft['origin'],
                                                                             aircraft['prefix'],
                                                                             aircraft['suffix'],
                                                                             aircraft['timeout'],
                                                                             aircraft['timestamp'],
                                                                             aircraft['type'],
                                                                             aircraft['updateType'],
                                                                             aircraft['waypoints']
                                                                            )
      end
    rescue
        raise FlightAwareError.new(rawSearchBirdseyeInFlightResult['error']).error
    end
  end
end

#SearchBirdseyePositions
class SearchBirdseyePositionsRequest
  attr_accessor :howMany, :offset, :query, :uniqueFlights 
  def initialize(howMany = nil, offset = nil, query = nil, uniqueFlights = nil)
    @howMany = howMany
    @offset = offset
    @query = query
    @uniqueFlights = uniqueFlights
  end 
  def post
    "howMany=#@howMany&offset=#@offset&query=#@query&uniqueFlights=#@uniqueFlights"
  end
end

class SearchBirdseyePositionsResults
  attr_accessor :searchBirdseyePositionsResult
  def initialize(searchBirdseyePositionsResult = nil)
    begin
      rawSearchBirdseyePositionResult = JSON.parse(searchBirdseyePositionsResult)
      searchBirdseyePositionsResult = rawSearchBirdseyePositionResult['SearchBirdseyePositionsResult']
      @searchBirdseyePositionsResult = ArrayOfTrackExStruct.new([], searchBirdseyePositionsResult['next_offset'])
      searchBirdseyePositionsResult['data'].each do |track|
        @searchBirdseyePositionsResult.data << TrackExStruct.new(track['altitude'],
                                                                 track['altitudeChange'],
                                                                 track['altitudeStatus'],
                                                                 track['faFlightID'],
                                                                 track['groundspeed'],
                                                                 track['latitude'],
                                                                 track['longitude'],
                                                                 track['timestamp'],
                                                                 track['updateType']
                                                                )
      end
    rescue
        raise FlightAwareError.new(rawSearchBirdseyePositionResult['error']).error
    end
  end
end

class ArrayOfTrackExStruct
  attr_accessor :data, :next_offset
  def initialize(data = [], next_offset = nil)
    @data = data
    @next_offset = next_offset
  end
end

class TrackExStruct
  attr_accessor :altitude, 
                :altitudeChange, 
                :altitudeStatus, 
                :faFlightID, 
                :groundspeed, 
                :latitude, 
                :longitude, 
                :timestamp, 
                :updateType
                
  def initialize(altitude = nil,
                 altitudeChange = nil,
                 altitudeStatus = nil,
                 faFlightID = nil,
                 groundspeed = nil,
                 latitude = nil,
                 longitude = nil,
                 timestamp = nil,
                 updateType = nil
                )
    @altitude = altitude
    @altitudeChange = altitudeChange
    @altitudeStatus = altitudeStatus
    @faFlightID = faFlightID
    @groundspeed = groundspeed
    @latitude = latitude
    @longitude = longitude
    @timestamp = timestamp
    @updateType = updateType
  end
end


#SearchCount
class SearchCountRequest
  attr_accessor :query
  def initialize(query = nil)
    @query = query
  end 
  def post
    "query=#@query"
  end
end

class SearchCountResults
  attr_accessor :searchCountResult
  def initialize(searchCountResult = nil)
    begin
      rawSearchCountResult = JSON.parse(searchCountResult)
      searchCountResult = rawSearchCountResult['SearchCountResult']
      @searchCountResult = searchCountResult
    rescue
        raise FlightAwareError.new(rawSearchCountResult['error']).error
    end
  end
end


#SetAlert
class SetAlertRequest
  attr_accessor :aircrafttype, 
                :alert_id, 
                :channels, 
                :date_end, 
                :date_start, 
                :destination, 
                :enabled, 
                :ident, 
                :max_weekly, 
                :origin
                
  def initialize(aircrafttype = nil,
                 alert_id = nil,
                 channels = nil,
                 date_end = nil,
                 date_start = nil,
                 destination = nil,
                 enabled = nil,
                 ident = nil,
                 max_weekly = nil,
                 origin = nil
                )
                
    @aircrafttype = aircrafttype
    @alert_id = alert_id
    @channels = channels
    @date_end = date_end
    @date_start = date_start
    @destination = destination
    @enabled = enabled
    @ident = ident
    @max_weekly = max_weekly
    @origin = origin
  end 
  def post
    "aircrafttype=#@aircrafttype&alert_id=#@alert_id&channels=#@channels&date_end=#@date_end&date_start=#@date_start" + 
    "&destination=#@destination&enabled=#@enabled&ident=#@ident&max_weekly=#@max_weekly&origin=#@origin"
  end
end

class SetAlertResults
  attr_accessor :setAlertResult
  def initialize(setAlertResult = nil)
    begin
      rawSetAlertResult = JSON.parse(setAlertResult)
      setAlertResult = rawSetAlertResult['SetAlertResult']
      @setAlertResult = setAlertResult
    rescue
        raise FlightAwareError.new(rawSetAlertResult['error']).error
    end
  end
end


#SetMaximumResultSize
class SetMaximumResultSizeRequest
  attr_accessor :max_size              
  def initialize(max_size = nil)            
    @max_size = max_size
  end 
  def post
    "max_size=#@max_size"
  end
end

class SetMaximumResultSizeResults
  attr_accessor :setMaximumResultSizeResult
  def initialize(setMaximumResultSizeResult = nil)
    begin
      rawSetMaximumResultSizeResult = JSON.parse(setMaximumResultSizeResult)
    setMaximumResultSizeResult = rawSetMaximumResultSize['SetMaximumResultSizeResult']
    @setMaximumResultSizeResult = setMaximumResultSizeResult
    rescue
        raise FlightAwareError.new(rawSetMaximumResultSizeResult['error']).error
    end
  end
end


#Taf
class TafRequest
  attr_accessor :airport              
  def initialize(airport = nil)            
    @airport = airport
  end 
  def post
    "airport=#@airport"
  end
end

class TafResults
  attr_accessor :tafResult
  def initialize(tafResult = nil)
    begin
      rawTafResult = JSON.parse(tafResult)
      tafResult = rawTafResult['TafResult']
      @tafResult = tafResult
    rescue
        raise FlightAwareError.new(rawTafResult['error']).error
    end
  end
end


#TailOwner
class TailOwnerRequest
  attr_accessor :ident              
  def initialize(ident = nil)            
    @ident = ident
  end 
  def post
    "ident=#@ident"
  end
end

class TailOwnerResults
  attr_accessor :tailOwnerResult
  def initialize(tailOwnerResult = nil)
    begin
      rawTailOwnerResult = JSON.parse(tailOwnerResult)
      tailOwnerResult = rawTailOwnerResult['TailOwnerResult']
      @tailOwnerResult = TailOwnerStruct.new(tailOwnerResult['location'],
                                             tailOwnerResult['location2'],
                                             tailOwnerResult['owner'],
                                             tailOwnerResult['website']
                                            )
    rescue
        raise FlightAwareError.new(rawTailOwnerResult['error']).error
    end
  end
end

class TailOwnerStruct
  attr_accessor :location, :location2, :owner, :website
  def initialize(location = nil, location2 = nil, owner = nil, website = nil)
    @location = location
    @location2 = location2
    @owner = owner
    @website = website
  end
end


#ZipcodeInfo
class ZipcodeInfoRequest
  attr_accessor :zipcode              
  def initialize(zipcode = nil)            
    @zipcode = zipcode
  end 
  def post
    "zipcode=#@zipcode"
  end
end

class ZipcodeInfoResults
  attr_accessor :zipcodeInfoResult
  def initialize(zipcodeInfoResult = nil)
    begin
      rawZipcodeInfoResult = JSON.parse(zipcodeInfoResult)
      zipcodeInfoResult = rawZipcodeInfoResult['ZipcodeInfoResult']
      @zipcodeInfoResult = ZipcodeInfoStruct.new(zipcodeInfoResult['city'],
                                                 zipcodeInfoResult['county'],
                                                 zipcodeInfoResult['latitude'],
                                                 zipcodeInfoResult['longitude'],
                                                 zipcodeInfoResult['state']    
                                                )
    rescue
        raise FlightAwareError.new(rawZipcodeInfoResult['error']).error
    end
  end
end

class ZipcodeInfoStruct
  attr_accessor :city, :county, :latitude, :longitude, :state
  def initialize(city = nil, county = nil, latitude = nil, longitude = nil, state = nil)
    @city = city
    @county = county
    @latitude = latitude
    @longitude = longitude
    @state = state
  end
end