class GroupsController < ApplicationController
  before_action :move_to_index
  
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
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
      redirect_to group_messages_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :content, :youtube_url, user_ids: [])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
