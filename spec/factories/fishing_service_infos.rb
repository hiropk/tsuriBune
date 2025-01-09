FactoryBot.define do
  factory :fishing_service_info do
    name { "MyString" }
    pref { 1 }
    number { 1 }
    registration_start_date { "2024-12-25" }
    registration_end_date { "2024-12-25" }
    address { "MyString" }
    ship_name { "MyString" }
    administrator { "MyText" }
    insurance_start_date { "2024-12-25" }
    insurance_end_date { "2024-12-25" }
  end
end
