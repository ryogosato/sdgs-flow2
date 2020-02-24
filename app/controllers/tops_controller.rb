class TopsController < ApplicationController
  def index
    @groups = Group.all
  end
end
