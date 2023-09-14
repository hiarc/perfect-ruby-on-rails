# コントローラーの基底クラス。
class ApplicationController < ActionController::Base
  # 例外LoginFailedが発生したらlogin_failedで処理する。
  rescue_from LoginFailed, with: :login_failed

  def login_failed
    render template: "shared/login_failed", status: 401
  end
end