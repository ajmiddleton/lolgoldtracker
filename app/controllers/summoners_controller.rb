class SummonersController < ApplicationController
  def index
    @summoner = Summoner.new
  end

  def create
    @summoner = Summoner.new.find_or_create_by_name(summoner_params["name"])
    if @summoner == "Bad Request"
      flash["alert"] = "That summoner name could not be found!"
      redirect_to root_path
    else
      redirect_to summoner_matches_path(@summoner)
    end
  end

  protected

  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
