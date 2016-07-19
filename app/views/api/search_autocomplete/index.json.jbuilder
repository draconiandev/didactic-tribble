json.activities do |json|
  json.array! @activities do |activity|
    json.id activity.id
    json.title truncate(activity.title, length: 38)
    json.url activity_path(activity.slug)
  end
end

json.categories do |json|
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
    json.url category_path(category.slug)
  end
end

json.destinations do |json|
  json.array! @destinations do |destination|
    json.id destination.id
    json.name destination.name
    json.url destination_path(destination.slug)
  end
end