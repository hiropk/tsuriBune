FactoryBot.define do
  factory :schedule do
    menu { nil }
    departure_type { 1 }
    num_reservation { 1 }
    memo { "MyText" }
    start_time { "2025-01-09 16:26:27" }
  end
end
