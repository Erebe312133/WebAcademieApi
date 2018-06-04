json.array! @skills do |skill|
  json.partial! 'skills/skill', skill: skill
end
