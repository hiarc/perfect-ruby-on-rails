Rails.application.routes.draw do
  # GETメソッドで「/books/:id」というパターンにマッチするパスへアクセスした時に、
  # Booksコントローラーのshowアクションを実行する
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destroy"
  resources :publishers
  resource :profile, only: %i{show edit update}
end
