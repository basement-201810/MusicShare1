# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create!(:name => '管理者', :name_kana => 'カンリシャ', :email => 'Music@Share', :password => 'mmmsss', :address => '管理者１丁目', :post_code => '000-0000', :tell => '000-0000-0000', :manager => 'true')

ProGenre.create(:pro_genre_name => 'J-POP')
ProGenre.create(:pro_genre_name => 'K-POP')
ProGenre.create(:pro_genre_name => 'アイドル')
ProGenre.create(:pro_genre_name => '童謡')
ProGenre.create(:pro_genre_name => 'Rock')
ProGenre.create(:pro_genre_name => 'EDM')
ProGenre.create(:pro_genre_name => 'Dance')
ProGenre.create(:pro_genre_name => 'Alternative')
ProGenre.create(:pro_genre_name => 'RAP/HIP-HOP')
ProGenre.create(:pro_genre_name => 'アニソン')
ProGenre.create(:pro_genre_name => 'Jazz')
ProGenre.create(:pro_genre_name => 'その他')

ProLabel.create(:pro_label_name => 'エイベックス')
ProLabel.create(:pro_label_name => 'ユニバーサル・ミュージック')
ProLabel.create(:pro_label_name => 'ワーナーミュージック・ジャパン')
ProLabel.create(:pro_label_name => 'ソニー・ミュージックエンターテインメント')
ProLabel.create(:pro_label_name => 'ウルトラ・ミュージック')
ProLabel.create(:pro_label_name => 'アルマダ・ミュージック')
ProLabel.create(:pro_label_name => 'モンスターキャット')
ProLabel.create(:pro_label_name => 'flying DOG')
ProLabel.create(:pro_label_name => 'SAKURA MUSIC')
ProLabel.create(:pro_label_name => 'TOHO animation RECORD')
ProLabel.create(:pro_label_name => 'ランティス')
ProLabel.create(:pro_label_name => 'ANIMEX')
ProLabel.create(:pro_label_name => 'バップ')
ProLabel.create(:pro_label_name => 'その他')