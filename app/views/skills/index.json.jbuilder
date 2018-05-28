json.array! @skills do |skill|
  json.partial! 'skill/skill', skill: skill
end
