# frozen_string_literal: true

require 'faker'
require 'csv'

CATEGORIES_PATH = Rails.root.join('lib', 'seeds', 'categories_seed.csv').freeze
CARDS_COUNT = 5
EXAMINATION_TYPES_PATH = Rails.root.join('lib', 'seeds', 'examination_types_seed.csv').freeze

ActiveRecord::Base.transaction do
  result = true
  CSV.foreach(CATEGORIES_PATH, col_sep: ';') do |row|
    result &&= Category.find_or_create_by(name: row[0], color: row[1])
  end

  CSV.foreach(EXAMINATION_TYPES_PATH) do |row|
    result &&= ExaminationType.find_or_create_by(name: row.first)
  end

  if Rails.env.development? || Rails.env.test?
    CARDS_COUNT.times do
      Card.create(
        birth_date: Date.current - [20, 30, 40].sample.years,
        chronic_diseases: Faker::Lorem.word,
        vital_medicines: Faker::Lorem.word,
        disability_group: (0...2).to_a.sample,
        blood_type: (0...7).to_a.sample,
        allergy_to_drugs: 'Work',
        uid: SecureRandom.uuid
      ).yield_self do |card|
        result &&= card.persisted?
      end
    end
    raise ActiveRecord::Rollback 'Failed' unless result

    puts "--Created cards count: #{Card.count}"
  end
end
puts 'Done'
