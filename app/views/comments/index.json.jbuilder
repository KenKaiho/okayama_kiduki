json.array!(@comments) do |comment|
  json.extract! comment, :id, :Comment
  json.url comment_url(comment, format: :json)
end
