class MatchesController < ApplicationController
  before_action :load_summoner

  def index
    @matches = Match.new.import_match_history @summoner.participant_id
  end

  protected

  def load_summoner
    @summoner = Summoner.find(params[:summoner_id])
  end
end
