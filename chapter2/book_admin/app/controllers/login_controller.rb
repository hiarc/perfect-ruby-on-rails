class LoginController < ApplicationController
  def create
    @user = User.where(name: parames[:name], password: params[:password]).find

    # リクエストパラメーターのnameとpasswordに一致するユーザーが存在しなければ例外をraiseする。
    raise LoginFailed unless @user
  end
end
