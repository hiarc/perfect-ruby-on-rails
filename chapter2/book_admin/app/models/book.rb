class Book < ApplicationRecord
  # 販売状況を表す列挙型。
  enum sales_status: {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 販売中
    end_of_print: 2, # 販売終了
  }

  # scopeの中にQueryInterfaceを記載
  scope :costly, ->(price) {where('price = ?', price)}
  # scopeの中にfind_byを記載。find_byの結果がnilになり、検索条件なし＝全取得になる例
  scope :costly_nilable, ->(price) {find_by(price: price)}
  # タイトルをLIKE検索する
  scope :written_about, ->(theme) {where("name like ?", "%#{theme}%")}

  # (1:多) Publisher:Bookを1:Nにする。Publisherに外部参照する
  belongs_to :publisher

  # (多:多) BookAuthorを中間モデルにする
  has_many :book_authors
  # (多:多) 中間モデルを使って、Book:AuthorをN：Nにする。
  has_many :authors, through: :book_authors

  #（バリデーション）名前は必ず存在する
  validates :name, presence: true
  #（バリデーション）名前は最大25文字
  validates :name, length: { maximum: 25 }
  #（バリデーション）価格は0円以上
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  #（バリデーション）カスタムバリデーション。名前にexericseを含むと特定のメッセージを持ったエラーを追加する。
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end

  #（コールバック）バリデーション前に自動実行するコールバック。Catをlovely Catに置き換える。
  before_validation :make_cat_lovely

  def make_cat_lovely
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  #（コールバック）高価な書籍が削除されたら確認を促す。
  after_destroy :if => :high_price? do
    Rails.logger.warn "高価な書籍が削除された。確認してください。: #{self.attributes}"
  end

  def high_price?
    price >= 500
  end
end