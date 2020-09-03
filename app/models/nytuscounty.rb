require 'csv'
require 'net/http'

class Nytuscounty < ApplicationRecord
 
    def self.getdata
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
        res = Net::HTTP.get(uri)
        something = CSV.parse(res)
        # while i < something.length do 
        # end
        p something[1][0]
    end
end
