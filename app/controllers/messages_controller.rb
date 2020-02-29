class MessagesController < ApplicationController
  before_action :set_group
  before_action :move_to_index, except: :index

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    @message.save
    redirect_to group_messages_path(@group)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to group_messages_path(@group)
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
