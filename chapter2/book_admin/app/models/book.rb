class Book < ApplicationRecord
  # scopeの中にQueryInterfaceを記載
  scope :costly, ->(price) {where('price = ?', price)}
  # scopeの中にfind_byを記載。find_byの結果がnilになり、検索条件なし＝全取得になる例
  scope :costly_nilable, ->(price) {find_by(price: price)}
  # タイトルをLIKE検索する
  scope :written_about, ->(theme) {where("name like ?", "%#{theme}%")}
end