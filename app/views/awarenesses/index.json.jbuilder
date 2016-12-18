json.array!(@awarenesses) do |awareness|
  json.extract! awareness, :id, :awareness
  json.url awareness_url(awareness, format: :json)
end
