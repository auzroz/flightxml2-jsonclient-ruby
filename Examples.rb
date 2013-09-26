require './FlightXML2RESTDriver.rb'
require './FlightXML2Rest.rb'

username = 'YourUserName'
apiKey = 'YourAPIKey'

#This provides the basis for all future calls to the API
test = FlightXML2REST.new(username, apiKey)

#AircraftType
result = test.AircraftType(AircraftTypeRequest.new('GALX'))
pp result.aircraftTypeResult
 
#AirlineFlightSchedules
result = test.AirlineFlightSchedules(AirlineFlightSchedulesRequest.new('UA', 'SFO', 1380153600, nil, 15, 0, 'EUG',  1380067200))
pp result.airlineFlightScheduleResult

#AirlineInfo
result = test.AirlineInfo(AirlineInfoRequest.new('COA'))
pp result.airlineInfoResult

#AirlineInsight
result = test.AirlineInsight(AirlineInsightRequest.new('SFO', 'EUG', 2))
pp result.airlineInsightResult

#AirportInfo
result = test.AirportInfo(AirportInfoRequest.new('KSFO'))
pp result.airportInfoResult

#AllAirlines
result = test.AllAirlines(AllAirlinesRequest.new())
pp result.allAirlinesResult

#AllAirports
result = test.AllAirports(AllAirportsRequest.new())
pp result.allAirportsResult

#Arrived
result = test.Arrived(ArrivedRequest.new('KSFO', 15, "airline", 0))
pp result.arrivedResult

