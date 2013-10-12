json.array!(@politicians) do |politician|
  json.extract! politician, :name, :party
  json.url politician_url(politician, format: :json)
end
