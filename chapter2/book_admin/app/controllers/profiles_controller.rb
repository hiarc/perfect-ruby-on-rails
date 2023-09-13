class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    # リクエストパラメーターをそのまま使って更新する例
    user = current_user
    user.update(params[:user])
  end

  private

  # リクエストパラメーターを信用せず、明示的に許可したキーのみ使う。
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
