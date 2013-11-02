json.array!(@votes) do |vote|
  json.extract! vote, :voter_id, :ballot_id, :office_id, :politician_id
  json.url vote_url(vote, format: :json)
end
