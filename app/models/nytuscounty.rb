require 'csv'
require 'net/http'
require 'active_record'
require 'activerecord-import'

class Nytuscounty < ApplicationRecord

    def self.get_data_first
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
        res = Net::HTTP.get(uri)
        val = CSV.parse(res)
        columns = [:date, :county, :state, :fips, :cases, :deaths]
        values = val
        
        Nytuscounty.import columns, values, validate: false, header: true
        
    end

    # def self.update_data
    #     uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
    #     res = Net::HTTP.get(uri)
    #     val = CSV.parse(res)
    #     #something slower that uses update
        
    #     # Nytuscounty.update
        
    # end
end

#  unique_by: :fips