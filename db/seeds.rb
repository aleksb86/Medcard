# frozen_string_literal: true

require 'faker'
require 'csv'

CATEGORIES_PATH = Rails.root.join('lib', 'seeds', 'categories_seed.csv').freeze
USERS = [
  { email: 'usr1@mail.ru', phone: '+79000000001', password: '12345678' },
  { email: 'usr2@mail.ru', phone: '+79000000002', password: '12345678' },
  { email: 'usr3@mail.ru', phone: '+79000000003', password: '12345678' },
  { email: 'usr4@mail.ru', phone: '+79000000004', password: '12345678' },
  { email: 'usr5@mail.ru', phone: '+79000000005', password: '12345678' }
].freeze
EXAMINATION_TYPES_PATH = Rails.root.join('lib', 'seeds', 'examination_types_seed.csv').freeze

ActiveRecord::Base.transaction do
  CSV.foreach(CATEGORIES_PATH, col_sep: ';') do |row|
    Category.find_or_create_by!(name: row.first)
  end

  CSV.foreach(EXAMINATION_TYPES_PATH, col_sep: ';') do |row|
    ExaminationType.find_or_create_by!(name: row.first)
  end

  if Rails.env.development? || Rails.env.test?
    USERS.each do |user|
      User.create!(
        email: user[:email],
        phone: user[:phone],
        password: user[:password]
      ).yield_self do |usr|
        usr.cards.create!(
          birth_date: Date.current - [20, 30, 40].sample.years,
          chronic_diseases: Faker::Lorem.word,
          vital_medicines: Faker::Lorem.word,
          disability_group: (0...2).to_a.sample,
          blood_type: (0...7).to_a.sample,
          allergy_to_drugs: 'Work',
          uid: SecureRandom.uuid
        )
      end
    end
  end
end
puts "--Created users count: #{User.count}\n--Created cards count: #{Card.count}\nDone"
