class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
  end

  def create
    @groups.messages.create(message_params)
    redirect_to group_messages_path(@groups)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @groups = Group.find(params[:group_id])
  end
end
