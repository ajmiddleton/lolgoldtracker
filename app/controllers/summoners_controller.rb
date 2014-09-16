class SummonersController < ApplicationController
  def index
    @summoner = Summoner.new
  end

  def create
    @submitted_name = summoner_params["name"]
    @summoner = Summoner.new
    @summoner = @summoner.api_lookup @submitted_name
    @summoner = @summoner.to_s
  end

  protected

  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
