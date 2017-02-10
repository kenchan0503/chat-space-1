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
      redirect_to "/groups/#{@group.id}/messages/", notice: "グループが作成されました。"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to "/groups/#{@group.id}/messages/", notice: "グループが更新されました。"
    else
      render :edit
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids:[])
    end
end
