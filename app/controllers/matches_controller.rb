class MatchesController < ApplicationController
  before_action :load_summoner

  def index
    Match.new.import_match_history @summoner
  end

  protected

  def load_summoner
    @summoner = Summoner.find(params[:summoner_id])
  end
end
