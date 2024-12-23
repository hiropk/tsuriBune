FactoryBot.define do
  factory :menu do
    sequence :name do |n|
      "menu#{n}"
    end
    embarkation_type { 1 }
    unit_price { 1 }
    acceptable_num { 1 }
    payment_method { 1 }
  end
end
