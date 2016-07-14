json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :activity_id, :image, :alt_text
  json.url gallery_url(gallery, format: :json)
end
