class UserFundProjectsController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @fund = @project.user_fund_projects.find(params[:id])
  end
  def new
    @user = current_user
    @project = Project.find(params[:project])
    @fund = @project.user_fund_projects.new
  end

  def create

  end


end
