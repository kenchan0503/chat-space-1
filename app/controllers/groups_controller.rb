class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループが作成されました。"
    else
      render :new
    end
    # TODO:messagesのルーティングと各グループの表示を設定して、作成したグループに飛ぶようにする。
    # TODO:グループ名一覧をindexのleft-contentに表示させる。
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids:[])
    end
end