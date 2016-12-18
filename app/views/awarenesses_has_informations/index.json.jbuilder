json.array!(@awarenesses_has_informations) do |awarenesses_has_information|
  json.extract! awarenesses_has_information, :id, :AwarenessesHasInformation
  json.url awarenesses_has_information_url(awarenesses_has_information, format: :json)
end
