require 'csv'
require 'net/http'
require 'active_record'
require 'activerecord-import'

class Nytuscounty < ApplicationRecord

    def self.get_data_first
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
        res = Net::HTTP.get(uri)
        something = CSV.parse(res)
        # while i < something.length do 
        # end
        p something[1][0]
    end

    # def self.update_data
    #     uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
    #     res = Net::HTTP.get(uri)
    #     val = CSV.parse(res)
    #     #something slower that uses updateßß
        
    #     # Nytuscounty.update
        
    # end
end

#  unique_by: :fips