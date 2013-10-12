json.array!(@ballots) do |ballot|
  json.extract! ballot, :election_date, :state, :county, :city, :ward, :precinct
  json.url ballot_url(ballot, format: :json)
end
