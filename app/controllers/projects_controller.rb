class ProjectsController < ApplicationController
  #before_action :require_owner, :except => [:show, :new, :create, :update, :index]

  def index
    unless search_params[:search_term].blank?
      projects = Project.all
      projects_hash = Hash.new
      projects.each do |project|
        project_data = ProjectDatum.current_project(project)
        projects_hash[project] = project_data
      end
      projects_data = ProjectDatum.where("name LIKE :search_term OR description LIKE :search_term AND visible = 1", search_term: "%#{search_params[:search_term]}%")

      projects_ids = Array.new
      projects_data.each do |pd|
        projects_ids.append pd.project_id
      end
      #byebug
      projects_ids.uniq!
      @projects = Project.where(id: projects_ids)
      @title = 'Projects containing: ' + search_params[:search_term]
      @keyword = search_params[:search_term]
    else
      @projects = Project.all
      @title = 'We have ' + @projects.size.to_s + " open project".pluralize(@projects.size)
    end
  end

  def show
    @project = Project.find(params[:id])
    @projectdata = ProjectDatum.current_project(@project)
    @user = @project.user
    @promises = Promise.where(project_id: @project)
    @founders = User.user_funds(@project)
  end

  def new
    @project = ProjectDatum.new
  end

  def create

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
      project_params = params.require(:project).permit(:id, :category, :user, :featured, :search_term)
    end

    def search_params
      search_params = params.permit(:search_term)
    end

end
