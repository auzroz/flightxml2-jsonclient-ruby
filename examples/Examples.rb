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

#InFlightInfo
result = test.InFlightInfo(InFlightInfoRequest.new("ASA244"))
pp result.inFlightInfoResult

#LatLongsToDistance
result = test.LatLongsToDistance(LatLongsToDistanceRequest.new(45.583333333333336, 45.56666666666667, -122.58333333333333, -122.46666666666667))
pp result.latLongsToDistanceResult

#LatLongsToHeading
result = test.LatLongsToHeading(LatLongsToHeadingRequest.new(45.583333333333336, 45.56666666666667, -122.58333333333333, -122.46666666666667))
pp result.latLongsToHeadingResult

#MapFlight
#TODO Tested, but received blank image
result = test.MapFlight(MapFlightRequest.new("UAL991", 200, 400))
pp result.mapFlightResult

#MapFlightEx
#TODO Tested, but received blank image
result = test.MapFlightEx(MapFlightExRequest.new(0, "SKW6400-1379568664-airline-0376", [0,0,45,45], ["US state boundaries"], ["US urban areas", "US Cities"], 480, 640, 1, 1))
pp result.mapFlightExResult

#Metar
result = test.Metar(MetarRequest.new('KSFO'))
pp result.metarResult

#MetarEx
result = test.MetarEx(MetarExRequest.new('KSFO', 0, 15, 0))
pp result.metarExResult

#NTaf
result = test.NTaf(NTafRequest.new('KSFO'))
pp result.nTafResult

#RegisterAlertEndpoint
result = test.RegisterAlertEndpoint(RegisterAlertEndpointRequest.new("http://www.acme.net/push"))
pp result.registerAlertEndpointResult

#RoutesBetweenAirports
result = test.RoutesBetweenAirports(RoutesBetweenAirportsRequest.new('KSFO', 'KEUG'))
pp result.routesBetweenAirportsResult

#RoutesBetweenAirportsEx
result = test.RoutesBetweenAirportsEx(RoutesBetweenAirportsExRequest.new('KSFO', 15, '3 days', '6 days' ,0 , 'KEUG'))
pp result.routesBetweenAirportsExResult

#Scheduled
result = test.Scheduled(ScheduledRequest.new('KSFO', 15, "airline", 0))
pp result.scheduledResult

#Search
result = test.Search(SearchRequest.new(15, 0, '-type B77*'))
pp result.searchResult

#SearchBirdseyeInFlight
result = test.SearchBirdseyeInFlight(SearchBirdseyeInFlightRequest.new(15, 0, '{match aircraftType B77*}'))
pp result.searchBirdseyeInFlightResult

#SearchBirdseyePositions
result = test.SearchBirdseyePositions(SearchBirdseyePositionsRequest.new(15, 0, '{match fp ASA*}', 0))
pp result.searchBirdseyePositionsResult

#SearchCount
result = test.SearchCount(SearchCountRequest.new('-type B77*'))
pp result.searchCountResult

#SetAlert
alert = SetAlertRequest.new()
alert.alert_id = 0
alert.ident = "AWE652"
alert.channels = "{16 e_filed e_departure e_arrival e_diverted e_cancelled}"
alert.date_start = alert.date_end = 1380326400
alert.enabled = true
alert.max_weekly = 1000
result = test.SetAlert(alert)
pp result.setAlertResult

#SetMaximumResultSize
result = test.SetMaximumResultSize(SetMaximumResultSizeRequest.new(15))
pp result.setMaximumResultSizeResult

#Taf
result = test.Taf(TafRequest.new('KSMF'))
pp result.tafResult

#TailOwner
result = test.TailOwner(TailOwnerRequest.new("SKW5463"))
pp result.tailOwnerResult

#ZipcodeInfo
result = test.ZipcodeInfo(ZipcodeInfoRequest.new('90210'))
pp result.zipcodeInfoResult