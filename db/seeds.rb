# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
[ "home", "menu", "ship", "safety", "schedule", "link" ].each do |page|
  [ "あいさつ", "予約", "お知らせ", "注意", "船の紹介", "船長の紹介", "表の見方" ].each do |head|
    PageContent.find_or_create_by!(display_page: page, head: head, contents: [])
  end
end
