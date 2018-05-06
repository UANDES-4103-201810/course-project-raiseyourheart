class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @projectdata = ProjectDatum.current_project(@project)
  end

  def new
    @project = Project.new
  end

  def create
    @project.new(project.params)
  end

  def edit
    @project = ProjectDatum.current_project(Project.find(params[:id]))
  end

  def update
    @project = Project.find(params[:id])
    # respond_to do |format|
    if @project.update(user_params)
      # format.html { redirect_to @user, notice: 'User was successfully updated.' }
      # format.json { render :show, status: :ok, location: @user }
      redirect_to @project, notice: "Succesful Project Update!."
    else
      # format.html { render :edit }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      redirect_to users_path @project, alert: "Error: Impossible to updated project."
    end
    # end
  end

  private
    def project_params
      project_params = params.require(:project).permit(:category, :user)
    end
end
