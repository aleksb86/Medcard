# frozen_string_literal: true

json.array! @cards do |card|
  json.id card.id
  json.birth_date card.birth_date
  json.chronic_diseases card.chronic_diseases
  json.vital_medicines card.vital_medicines
  json.disability_group_details card.disability_group_details
  json.allergy_to_drugs card.allergy_to_drugs
  json.disability_group card.disability_group
  json.blood_type card.blood_type
  json.uid card.uid
end
