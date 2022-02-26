# frozen_string_literal: true

FactoryBot.define do
  factory :track do
    album_id { Faker::Number.number(digits: 10) }
    album_name { Faker::Music::Phish.album }
    artists { Faker::Music::Phish.musician }
    isrc { Faker::Number.number(digits: 10) }
    name { Faker::Music::Phish.song }
    played_at { Faker::Time.between_dates(from: Date.today - 10, to: Date.today, period: :all) }
    preview_url { Faker::Internet.url }
    spotify_id { Faker::Number.number(digits: 10) }
  end
end
