class Author < ApplicationRecord
  # (多:多) BookAuthorを中間モデルにする
  has_many :book_authors
  # (多:多) 中間モデルを使って、Book:AuthorをN：Nにする。
  has_many :books, through: :book_authors
end
