json.languages do
  project.languages.each do |language|
    json.set! language.key, language.value
  end
end
json.name project.name
json.descriptive project.descriptive
json.links do
  project.links.each do |link|
    json.set! link.key, link.value
  end
end
json.id project.id
json.userId project.user.id
