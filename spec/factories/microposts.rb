FactoryBot.define do
  factory :micropost do
    sequence :content do |n|
      "micropost#{n}"
    end
    user { nil }
  end
end
