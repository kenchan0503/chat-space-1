class MessagesController < ApplicationController

  def index
  #サイドバー表示用
    @groups = current_user.groups

  #メイン画面表示用
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @users = @group.users

  #メッセージ送信用
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      redirect_to group_messages_path(params[:group_id]), alert: "何かメッセージを入力してください。"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end
