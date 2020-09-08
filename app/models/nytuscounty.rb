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
        uri = URI.parse('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
        res = Net::HTTP.get(uri)
        items = []
        CSV.parse(res, headers: true) do |row|

            obj = Nytuscounty.find_by(date: row["date"], fips: row["fips"])
            if obj.cases == row["cases"]
                obj.cases = row["cases"] 
            elsif obj.deaths == row["deaths"]
                obj.cases = row["deaths"]
            elsif obj.confirmed_cases == row["confirmed_cases"]
                obj.confirmed_cases = row["confirmed_cases"]
            elsif obj.confirmed_deaths == row["confirmed_deaths"]
                obj.confirmed_deaths = row["confirmed_deaths"]
            end
            obj.save
        end

    end
end

# {conflict_target: [:date, :fips], columns: {county: state: cases: deaths: confirmed_cases: confirmed_deaths: probable_cases: probable_deaths:}\