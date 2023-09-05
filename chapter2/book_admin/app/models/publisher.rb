class Publisher < ApplicationRecord
  # (1:多) Publisher:Bookを1:Nにする。Booksから外部参照される
  has_many :books
end
