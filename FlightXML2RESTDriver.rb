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
      @aircraftTypeResult = AircraftTypeResults.new($api['AircraftType'].post aircraftTypeRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AirlineFlightInfo(airlineFlightInfoRequest)
      @airlineFlightInfoResult = AirlineFlightInfoResults.new($api['AirlineFlightInfo'].post airlineFlightInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AirlineFlightSchedules(airlineFlightSchedulesRequest)
      @airlineFlightSchedulesResult = AirlineFlightSchedulesResults.new($api['AirlineFlightSchedules'].post airlineFlightSchedulesRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AirlineInfo(airlineInfoRequest)
      @airlineInfoResult = AirlineInfoResults.new($api['AirlineInfo'].post airlineInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AirlineInsight(airlineInsightRequest)
      @airlineInsightResult = AirlineInsightResults.new($api['AirlineInsight'].post airlineInsightRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AirportInfo(airportInfoRequest)
      @airportInfoResult = AirportInfoResults.new($api['AirportInfo'].post airportInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AllAirlines(allAirlinesRequest)
      @allAirlinesResult = AllAirlinesResults.new($api['AllAirlines'].post allAirlinesRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def AllAirports(allAirportsRequest)
      @allAirportsResult = AllAirportsResults.new($api['AllAirports'].post allAirportsRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def Arrived(arrivedRequest)
      @arrivedResult = ArrivedResults.new($api['Arrived'].post arrivedRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def BlockIdentCheck(blockIdentCheckRequest)
      @blockIdentCheckResult = BlockIdentCheckResults.new($api['BlockIdentCheck'].post blockIdentCheckRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def CountAirportOperations(countAirportOperationsRequest)
      @countAirportOperationsResult = CountAirportOperationsResults.new($api['CountAirportOperations'].post countAirportOperationsRequest.post, :content_type => "application/x-www-form-urlencoded")
    end  
    
    def CountAllEnrouteAirlineOperations(countAllEnrouteAirlineOperationsRequest)
      @countAllEnrouteAirlineOperationsResult = CountAllEnrouteAirlineOperationsResults.new($api['CountAllEnrouteAirlineOperations'].post countAllEnrouteAirlineOperationsRequest.post, :content_type => "application/x-www-form-urlencoded")
    end  
    
    def DecodeFlightRoute(decodeFlightRouteRequest)
      @decodeFlightRouteResult = DecodeFlightRouteResults.new($api['DecodeFlightRoute'].post decodeFlightRouteRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def DecodeRoute(decodeRouteRequest)
      @decodeRouteResult = DecodeRouteResults.new($api['DecodeRoute'].post decodeRouteRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def DeleteAlert(deleteAlertRequest)
      @deleteAlertResult = DeleteAlertResults.new($api['DeleteAlert'].post deleteAlertRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def Departed(departedRequest)
      @departedResult = DepartedResults.new($api['Departed'].post departedRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def Enroute(enrouteRequest)
      @enrouteResult = EnrouteResults.new($api['Enroute'].post enrouteRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def FleetArrived(fleetArrivedRequest)
      @fleetArrivedResult = FleetArrivedResults.new($api['FleetArrived'].post fleetArrivedRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def FleetScheduled(fleetScheduledRequest)
      @fleetScheduledResult = FleetScheduledResults.new($api['FleetScheduled'].post fleetScheduledRequest.post, :content_type => "application/x-www-form-urlencoded")
    end
    
    def FlightInfo(flightInfoRequest)
      flightInfoResult = FlightInfoResults.new($api['FlightInfo'].post flightInfoRequest.post, :content_type => "application/x-www-form-urlencoded")
      @flightInfoResult = flightInfoResult   
    end
    def FlightInfoEx(flightInfoExRequest)
      flightInfoExResult = FlightInfoExResults.new($api['FlightInfoEx'].post flightInfoExRequest.post, :content_type => "application/x-www-form-urlencoded")
      @flightInfoExResult = flightInfoExResult        
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
