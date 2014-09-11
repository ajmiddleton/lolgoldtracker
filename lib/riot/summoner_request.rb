class SummonerRequest < RiotApi
  def self.api_version
    "v1.4"
  end

  def by_name name
    name = CGI.escape name.downcase.gsub(/\s/, '')
    response = perform_request(api_url("summoner/by-name/#{name}"))
    response[response.keys[0]]
  end

  def by_id id
    response = perform_request(api_url("summoner/#{id}"))
    response[response.keys[0]]
  end
end
