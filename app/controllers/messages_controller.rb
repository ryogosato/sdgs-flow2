class MessagesController < ApplicationController
  def index
    @groups = Group.find(params[:group_id])
  end

  def edit
  end
end
