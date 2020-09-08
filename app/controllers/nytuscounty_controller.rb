class NytuscountyController < ApplicationController
    # before_action :authorized

    def getdata
        @data = []
        @fips = params[:fips]

        (Date.today-6..Date.today).each do |d|
            @data.push(Nytuscounty.where(date: d.strftime("%Y-%d-%m"), fips: @fips))
        end
        byebug
        render json: { data: @data }, status: :accepted
    end



end
