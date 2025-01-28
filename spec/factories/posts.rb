# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { FFaker::Book.title }
    body { FFaker::Lorem.paragraph }
    author { FFaker::Name.name }
  end
end
