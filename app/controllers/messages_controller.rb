class MessagesController < ApplicationController
  def index
    #サイドバー表示用
    @groups = current_user.groups
    #メイン画面表示用
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @users = @group.users
  end
end
