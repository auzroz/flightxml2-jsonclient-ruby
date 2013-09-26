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
    attr_accessor :airlineFlightInfoResults
  def initialize(airlineFlightInfoResults = nil)
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
                  seats_cabin_coash = nil,
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
    @seats_cabin_coach = seat_cabin_coach
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
                                                         arrival['originName'],
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
