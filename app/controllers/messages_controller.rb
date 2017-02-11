class MessagesController < ApplicationController
  before_action :set_view_instance_variables, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      @message = Message.new
      render :index
    else
      flash.now[:alert] = "何かメッセージを入力してください。"
      render :index
    end
  end

  private
    def message_params
      params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
    end

    def set_view_instance_variables
      #サイドバー表示用
      @groups = current_user.groups

      #メイン画面表示用
      @group = Group.find(params[:group_id])
      @messages = @group.messages
      @users = @group.users
    end
end
