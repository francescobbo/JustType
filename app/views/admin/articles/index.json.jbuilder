json.array! articles do |article|
  json.id article.id
  json.title article.title
  json.slug article.slug
  json.original_content article.original_content
  json.rendered_content article.rendered_content
end
