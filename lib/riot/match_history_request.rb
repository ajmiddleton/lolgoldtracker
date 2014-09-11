class MatchHistoryRequest < RiotApi
  def self.api_version
    "v2.2"
  end

  def by_summoner_id id
    response = perform_request(api_url("matchhistory/#{id}"))
    response["matches"]
  end
end
