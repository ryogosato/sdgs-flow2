class TopsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end
end
