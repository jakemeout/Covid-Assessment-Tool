require 'csv'
require 'net/http'
require 'active_record'
require 'activerecord-import'

class Nytuscounty < ApplicationRecord

    def self.get_data_first
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
        res = Net::HTTP.get(uri)
        items = []
        CSV.parse(res, headers: true) do |row|
          items << row.to_h
        end
        
        Nytuscounty.upsert_all(items)
    end

    def self.update_data
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-counties.csv')
        res = Net::HTTP.get(uri)
        values = CSV.parse(res)
        columns = [:date, :county, :state, :fips, :cases, :deaths, :confirmed_cases, :confirmed_deaths, :probable_cases, :probable_deaths]

        Nytuscounty.import columns, values

    end

    def self.get_population(fips)
            num = fips.to_s
            county = num.last(3)
        if num.length < 5
            state = "0" + num.first()
        end
        
            uri = URI(`https://api.census.gov/data/2019/pep/population?get=COUNTY,DATE_CODE,DATE_DESC,DENSITY,POP,NAME,STATE&for=county:#{county}&for=state:#{state}key=#{ENV["census_gov_key"]}`)
            
            res = Net::HTTP.get(uri)
            res
            byebug
    end
end

# {conflict_target: [:date, :fips], columns: {county: state: cases: deaths: confirmed_cases: confirmed_deaths: probable_cases: probable_deaths:}\