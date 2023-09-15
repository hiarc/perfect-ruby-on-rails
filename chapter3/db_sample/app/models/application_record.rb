class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: {
    # 書き込み用の接続ロール
    writing: :primary,
    # 読み込み用の接続ロール
    reading: :primary_replica
  }
end
