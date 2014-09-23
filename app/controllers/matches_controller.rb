class MatchesController < ApplicationController
  before_action :load_summoner

  def index
    Match.new.import_match_history @summoner
    gon.gold_earned_vs_gold_spent = @summoner.gold_earned_vs_gold_spent
    gon.gold_per_min = @summoner.gold_per_min
  end

  protected

  def load_summoner
    @summoner = Summoner.find(params[:summoner_id])
  end
end
