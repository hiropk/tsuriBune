# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

[ "あいさつ", "予約", "お知らせ", "注意" ].each do |head|
  PageContent.find_or_create_by!(display_page: "home", head: head, contents: [])
end

[ "船の紹介", "船長の紹介" ].each do |head|
  PageContent.find_or_create_by!(display_page: "ship", head: head, contents: [])
end

[ "表の見方", "予約" ].each do |head|
  PageContent.find_or_create_by!(display_page: "schedule", head: head, contents: [])
end
