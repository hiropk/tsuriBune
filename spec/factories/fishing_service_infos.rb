FactoryBot.define do
  factory :fishing_service_info do
    name { "船長氏名" }
    pref { 1 }
    number { 1 }
    registration_start_date { Date.current }
    registration_end_date { Date.current + 1.year }
    address { "遊漁船営業所の住所" }
    ship_name { "遊漁船名" }
    administrator { [ "船長1氏名", "船長2氏名" ] }
    insurance_start_date { Date.current }
    insurance_end_date { Date.current + 1.year }
  end
end
