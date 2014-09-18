namespace :lol_gold_tracker do
  desc "Import fresh match history for each summoner"
  task import_fresh_match_history: :environment do
    puts "Importing fresh match data"
    Summoner.all.each do |s|
      Match.new.import_match_history s
    end
  end
end
