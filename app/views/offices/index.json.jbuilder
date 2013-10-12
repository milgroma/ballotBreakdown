json.array!(@offices) do |office|
  json.extract! office, :ballot_ids, :tier, :office, :district, :territory, :term_limit, :terms
  json.url office_url(office, format: :json)
end
