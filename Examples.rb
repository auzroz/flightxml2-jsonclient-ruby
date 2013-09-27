require './FlightXML2RESTDriver.rb'
require './FlightXML2Rest.rb'

username = 'YourUserName'
apiKey = 'YourAPIKey'

#This provides the basis for all future calls to the API
test = FlightXML2REST.new(username, apiKey)

#AircraftType
result = test.AircraftType(AircraftTypeRequest.new('GALX'))
pp result.aircraftTypeResult

#AirlineFlightInfo
result = test.AirlineFlightInfo(AirlineFlightInfoRequest.new("SKW6400-1379568664-airline-0376"))
pp result.airlineFlightInfoResult
 
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

#BlockIdentCheck
result = test.BlockIdentCheck(BlockIdentCheckRequest.new('N644AA'))
pp result.blockIdentCheckResult

#CountAirportOperations
result = test.CountAirportOperations(CountAirportOperationsRequest.new('KSFO'))
pp result.countAirportOperationsResult

#CountEnrouteAirlineOperations
result = test.CountAllEnrouteAirlineOperations(CountAllEnrouteAirlineOperationsRequest.new())
pp result.countAllEnrouteAirlineOperationsResult

#DecodeFlightRoute
result = test.DecodeFlightRoute(DecodeFlightRouteRequest.new(faFlightID))
pp result.decodeFlightRouteResult

#DecodeRoute
result = test.DecodeRoute(DecodeRouteRequest.new('KSFO','KEUG','RBG GOLDN6'))
pp result.decodeRouteResult

#DeleteAlert
result = test.DeleteAlert(DeleteAlertRequest.new(1))
pp result.deleteAlertResult

#Departed
result = test.Departed(DepartedRequest.new('KSFO', 'ga', 15, 0 ))
pp result.departedResult

#Enroute
result = test.Enroute(EnrouteRequest.new('KSFO', 'ga', 15, 0 ))
pp result.enrouteResult

#FleetArrived
result = test.FleetArrived(FleetArrivedRequest.new('SKW', 15, 0))
pp result.fleetArrivedResult

#FleetScheduled
result = test.FleetScheduled(FleetScheduledRequest.new('SKW', 15, 0))
pp result.fleetScheduledResult

#FlightInfo
result = test.FlightInfo(FlightInfoRequest.new(15, 'SKW6400'))
pp result.flightInfoResult

#FlightInfoEx
result = test.FlightInfoEx(FlightInfoExRequest.new(15, 'SKW6400', 0))
pp result.flightInfoExResult

#GetAlerts
result = test.GetAlerts(GetAlertsRequest.new())
pp result.getAlertsResult

#GetFlightID
result = test.GetFlightID(GetFlightIDRequest.new(1379123880, 'SKW5300'))
pp result.getFlightIDResult

#GetHistoricalTrack
result = test.GetHistoricalTrack(GetHistoricalTrackRequest.new("SKW6400-1379568664-airline-0376"))
pp result.getHistoricalTrackResult

#GetLastTrack
result = test.GetLastTrack(GetLastTrackRequest.new("SWA5300"))
pp result.getLastTrackResult

#InboundFlightInfo
result = test.InboundFlightInfo(InboundFlightInfoRequest.new(faFlightID))
pp result.inboundFlightInfoResult