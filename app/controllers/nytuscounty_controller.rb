class NytuscountyController < ApplicationController
    # before_action :authorized

    def getdata
        date = d.strftime("%Y-%d-%m")
        @data =  Nytuscounty.where(date:date, fips: params[:fips])
        render json: { data: @data }, status: :accepted
    end

end
