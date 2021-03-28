require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

    #is a class that can be initiated by passing in a URL
    def initialize(url)
        @url = url
    end

    #is an instance method on the GetRequester class
    #sends a GET request to the URL provided on initialization, returning the body of the request
    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    #is an instance method on the GetRequester class
    #converts JSON returned from 'get_response_body' into Ruby data structures
    def parse_json
        JSON.parse(self.get_response_body)
    end
end

# get_requester = GetRequester.new
# puts get_requester.parse_json