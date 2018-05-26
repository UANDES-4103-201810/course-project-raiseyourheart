class ProjectsController < ApplicationController
  before_action :require_owner, :except => [:show, :new, :create, :index]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @projectdata = ProjectDatum.current_project(@project)
    @user = @project.user
    @promises = Promise.where(project_id: @project)
    @founders = User.user_funds(@project)
  end

  def new
    @project = Project.new
  end

  def create
    @project.new(project.params)
  end

  def edit
    @project = ProjectDatum.current_project(Project.find(params[:id]))
    @user = Project.find(params[:id]).user
  end

  def update
    @project = Project.find(params[:id])
    # respond_to do |format|
    if @project.update(project_params)
      # format.html { redirect_to @user, notice: 'User was successfully updated.' }
      # format.json { render :show, status: :ok, location: @user }
      redirect_to @project, notice: "Successful Project Update!."
    else
      # format.html { render :edit }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      redirect_to users_path @project, alert: "Error: Impossible to update project."
    end
    # end
  end

  private
    def project_params
      project_params = params.require(:project).permit(:id, :category, :user, :featured)
    end

    def require_owner
      @project=Project.find(params[:id])
      @user = current_user
      unless @project.user == @user || current_user_admin?
        redirect_to root_url, alert: "Unauthorized access!"
      end
    end
end
