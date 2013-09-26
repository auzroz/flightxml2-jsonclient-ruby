require 'rest-client'
require 'json'
require './FlightXML2REST.rb'

  class FlightXML2REST
    DefaultEndpointUrl = "http://flightxml.flightaware.com/json/FlightXML2/"
    attr_accessor :username, :apiKey, :endpoint_url
    
    def initialize(username, apiKey, endpoint_url = nil)
      endpoint_url ||= DefaultEndpointUrl
      $api = RestClient::Resource.new(endpoint_url, username, apiKey)
    end
    
    #Methods
    def AircraftType(aircraftTypeRequest)
      aircraftTypeResult = AircraftTypeResults.new($api['AircraftType'].post aircraftTypeRequest.post, :content_type => "application/x-www-form-urlencoded")
      @aircraftTypeResult = aircraftTypeResult
    end
    
    def AirlineFlightInfo(airlineFlightInfoRequest)
      airlineFlightInfoResult = AirlineFlightInfoResults.new($api['AirlineFlightInfo'].post airlineFlightInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
      @airlineFlightInfoResult = airlineFlightInfoResult 
    end
    
    def AirlineFlightSchedules(airlineFlightSchedulesRequest)
      airlineFlightSchedulesResult = AirlineFlightSchedulesResults.new($api['AirlineFlightSchedules'].post airlineFlightSchedulesRequest.post, :content_type => "application/x-www-form-urlencoded")
      @airlineFlightSchedulesResult = airlineFlightSchedulesResult
    end
    
    def AirlineInfo(airlineInfoRequest)
      airlineInfoResult = AirlineInfoResults.new($api['AirlineInfo'].post airlineInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
      @airlineInfoResult = airlineInfoResult
    end
    
    def AirlineInsight(airlineInsightRequest)
      airlineInsightResult = AirlineInsightResults.new($api['AirlineInsight'].post airlineInsightRequest.post, :content_type => "application/x-www-form-urlencoded")
      @airlineInsightResult = airlineInsightResult
    end
    
    def AirportInfo(airportInfoRequest)
      airportInfoResult = AirportInfoResults.new($api['AirportInfo'].post airportInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
      @airportInfoResult = airportInfoResult
    end
    def AllAirlines(allAirlinesRequest)
      allAirlinesResult = AllAirlinesResults.new($api['AllAirlines'].post allAirlinesRequest.post, :content_type => "application/x-www-form-urlencoded")
      @allAirlinesResult = allAirlinesResult
    end
    def AllAirports(allAirportsRequest)
      allAirportsResult = AllAirportsResults.new($api['AllAirports'].post allAirportsRequest.post, :content_type => "application/x-www-form-urlencoded")
      @allAirportsResult = allAirportsResult
    end
    def Arrived(arrivedRequest)
      arrivedResult = ArrivedResults.new($api['Arrived'].post arrivedRequest.post, :content_type => "application/x-www-form-urlencoded")
      @arrivedResult = arrivedResult      
    end
    def BlockIdentCheck(blockIdentCheckRequest)
      
    end
    def CountAirportOperations(countAirportOperationsRequest)
      
    end  
    def CountAllEnrouteAirlineOperations(countAllEnrouteAirlineOperationsRequest)
      
    end  
    def DecodeFlightRoute(decodeFlightRouteRequest)
      
    end
    def DecodeRoute(decodeRouteRequest)
      
    end
    def DeleteAlert(deleteAlertRequest)
      
    end
    def Departed(departedRequest)
      
    end
    def Enroute(enrouteRequest)
      
    end
    def FleetArrived(fleetArrivedRequest)
      
    end
    def FleetScheduled(fleetScheduledRequest)
      
    end
    def FlightInfo(flightInfoRequest)
      
    end
    def FlightInfoEx(flightInfoExRequest)
      
    end
    def GetAlerts(getAlertsRequest)
      
    end
    def GetFlightID(getFlightIDRequest)
      
    end
    def GetHistoricalTrack(getHistoricalTrackRequest)
      
    end
    def GetLastTrack(getLasTrackRequest)
      
    end
    def InboundFlightInfo(inboundFlightInfoRequest)
      
    end
    def InFlightInfo(inFlightInfoRequest)
      
    end
    def LatLongsToDistance(latLongsToDistanceRequest)
      
    end
    def LatLongsToHeading(latLongsToHeadingRequest)
      
    end
    def MapFlight(mapFlightRequest)
      
    end
    def MapFlightEx(mapFlightExRequest)
      
    end
    def Metar(metarRequest)
      
    end
    def MetarEx(metarExRequest)
      
    end
    def NTaf(nTafRequest)
      
    end
    def RegisterAlertEndpoint(registerAlertEndpoingRequest)
      
    end
    def RoutesBetweenAirports(routesBetweenAirportsRequest)
      
    end
    def RoutesBetweenAirportsEx(routesBetweenAirportsExRequest)
      
    end
    def Scheduled(scheduledRequest)
      
    end
    def Search(searchRequest)
      
    end
    def SearchBirdseyeInFlight(searchBirdseyeInFlightRequest)
      
    end
    def SearchBirdseyePositions(searchBirdseyePositionsRequest)
      
    end
    def SearchCount(searchCountRequest)
      
    end
    def SetAlert(setAlertRequest)
      
    end
    def SetMaximumResultSize(setMaximumResultSizeRequest)
      
    end
    def Taf(tafRequest)
      
    end
    def TailOwner(tailOwnerRequest)
      
    end
    def ZipcodeInfo(zipCodeInfoRequest)
      
    end
  end
