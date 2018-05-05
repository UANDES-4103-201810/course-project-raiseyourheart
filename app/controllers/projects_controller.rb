class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project.new(project.params)
  end

  private
    def project_params
      project_params = params.require(:project).permit(:category, :user)
    end
end
