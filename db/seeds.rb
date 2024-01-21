# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adminのシードデータ
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

# Userのシードデータ
olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.user_name = "Olivia"
  user.password = "password"
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.user_name = "James"
  user.password = "password"
end


# ライフハック投稿記事のシードデータ
Lifehack.find_or_create_by!(title: "捨てる前にタオルを活用") do |lifehack|
  lifehack.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-lifehack1.jpg"), filename:"sample-lifehack1.jpg")
  lifehack.body = "古くなってしまったタオルは小さく切って、油汚れ拭きようにストックしておくと便利！"
  lifehack.user = olivia
  lifehack.lifehack_tags.each do |lifehack_tag|
    lifehack_tag.ltag_name = "掃除"
  end
end

# アイテム投稿記事のシードデータ
Item.find_or_create_by!(item_title: "ケーブル収納") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item1.jpg"), filename:"sample-item1.jpg")
  item.item_body = "収納しにくい充電ケーブルなどをスッキリ収納できます。百円均一ショップなどで購入できます"
  item.user = james
  item.item_tags.each do |item_tag|
    item_tag.itag_name = "収納"
  end
end

puts "seedの実行が完了しました"
