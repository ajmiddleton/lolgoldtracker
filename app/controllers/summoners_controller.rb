class SummonersController < ApplicationController
  def index
    @summoner = Summoner.new
  end

  def create
    @summoner = Summoner.new.find_or_create_by_name(summoner_params["name"])
    redirect_to summoner_matches_path(@summoner)
  end

  protected

  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
