json.type "FeatureCollection"

json.features do
  json.array!(@features) do |feature|
    json.type           "Feature"
    json.geometry do
      json.type         "Point"
      json.coordinates  feature.coordinates.map(&:to_f)
    end
    json.properties do
      json.id           feature.identity
      json.price        feature.price
      json.street       feature.street
      json.bedrooms     feature.bedrooms
      json.bathrooms    feature.bathrooms
      json.sq_ft        feature.sq_ft
    end
  end
end
