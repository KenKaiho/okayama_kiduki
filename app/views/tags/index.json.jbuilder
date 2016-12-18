json.array!(@tags) do |tag|
  json.extract! tag, :id, :Tag
  json.url tag_url(tag, format: :json)
end
