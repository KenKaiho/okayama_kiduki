json.array!(@information) do |information|
  json.extract! information, :id, :Information
  json.url information_url(information, format: :json)
end
