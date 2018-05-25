class UserFundProjectsController < ApplicationController

  def new
    @user = current_user
    @project = Project.find(params[:id])
    @fund = UserFundProject.New
  end

  def create

  end


end
