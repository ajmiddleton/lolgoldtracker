class MatchesController < ApplicationController
  before_action :load_summoner
  before_action :load_match, only: [:show]
  before_filter -> { gon.clear }

  def index
    Match.new.import_match_history @summoner
    gon.gold_earned_vs_gold_spent = @summoner.gold_earned_vs_gold_spent
    gon.gold_per_min = @summoner.gold_per_min
  end

  def show
    gon.timeline_data = @match.timeline_data
  end

  protected

  def load_match
    @match = Match.find(params[:id])
  end

  def load_summoner
    @summoner = Summoner.find(params[:summoner_id])
  end
end
