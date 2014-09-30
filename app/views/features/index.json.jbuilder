json.array!(@features) do |feature|
  json.extract! feature, :id, :name, :length, :sequence, :start, :end, :annotation
  json.url feature_url(feature, format: :json)
end
