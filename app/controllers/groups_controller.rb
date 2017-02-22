class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group.id), notice: "グループが作成されました。"
    else
      render :new
    end
  end

  def edit
    get_chosen_group
    @users = User.where.not(id: current_user.id)
    @members = @group.users.where.not(id: current_user.id)
  end

  def update
    get_chosen_group
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: "グループが更新されました。"
    else
      render :edit
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

    def get_chosen_group
      @group = Group.find(params[:id])
    end
end
