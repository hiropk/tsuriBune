FactoryBot.define do
  factory :page_content do
    display_page { 1 }
    head { "MyString" }
    contents { "MyText" }
  end
end
