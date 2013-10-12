json.array!(@notes) do |note|
  json.extract! note, :politician_id, :note, :rank
  json.url note_url(note, format: :json)
end
