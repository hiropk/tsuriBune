# adin_user
unless User.count >= 1
  User.new(email_address: 'admin@example.com', password: 'password', password_confirmation: 'password').save!
end

# micropost
Micropost.find_or_create_by!(
  content: "初めての投稿文",
  user_id: User.first.id
)

# page_contents
[ "あいさつ", "予約", "お知らせ", "注意" ].each do |head|
  PageContent.find_or_create_by!(display_page: "home", head: head, contents: [])
end

[ "船の紹介", "船長の紹介" ].each do |head|
  PageContent.find_or_create_by!(display_page: "ship", head: head, contents: [])
end

[ "表の見方", "予約" ].each do |head|
  PageContent.find_or_create_by!(display_page: "schedule", head: head, contents: [])
end

# menus
Menu.find_or_create_by!(
  name: "ジギング",
  embarkation_type: 0,
  unit_price: 10000,
  acceptable_num: 10,
  payment_method: 0
)

# fishing_service_info
FishingServiceInfo.find_or_create_by!(
  name: "遊漁船の氏名又は名称",
  pref: 1,
  number: 12345,
  registration_start_date: Date.current,
  registration_end_date: Date.current + 1.year,
  address: "遊漁船の営業所の住所",
  ship_name: "遊漁船の名称",
  administrator: [ "第一船長氏名", "第二船長氏名", "第三船長氏名" ],
  insurance_start_date: Date.current,
  insurance_end_date: Date.current + 1.year,
)

# スケジュール
Schedule.find_or_create_by!(
  menu_id: Menu.first.id,
  num_reservation: 1,
  memo: "メモ",
  start_time: DateTime.current
)

# business_regulation
records = [
  [ "別表4", "遊漁船のトン数または長さ、定員及び通信設備", 1 ],
  [ "別表6", "安全の確保のため船長及び業務主任者が遵守すべき事項", 2 ],
  [ "別表7", "出航中止基準及び帰航基準", 3 ],
  [ "別表8", "気象又は海象等の状況が悪化した場合の対処", 4 ],
  [ "別表10", "情報を収集すべき事項", 5 ],
  [ "別表11", "安全の確保のため周知すべき内容及び方法", 6 ],
  [ "別表12", "公表する情報", 7 ]
]

records.each { |record|
  BusinessRegulation.find_or_create_by!(
    title: record.first,
    subtitle: record.second,
    page_num: record.third
  )
}
