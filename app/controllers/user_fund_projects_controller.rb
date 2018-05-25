class UserFundProjectsController < ApplicationController


  def new
    if current_user.nil?
      @user = User.find_by(first: "Anonymous")
    else
      @user = current_user
    end
    @project = Project.find(params[:project])
    @fund = @project.user_fund_projects.new
  end

  def create
    if current_user.nil?
      @user = User.find_by(first: "Anonymous")
    else
      @user = current_user
    end
    puts @user.id
    @project = Project.find(params[:project_id])
    amount_raised = UserFundProject.amount_raised(@project) + amount_param[:amount].to_f
    puts amount_raised
    @project_datum = ProjectDatum.current_project(@project)

    new_params = Hash.new
    new_params["amount_raised"] = amount_raised
    new_params["visible"] = @project_datum.visible
    new_params["goal"] = @project_datum.goal
    new_params["category_id"] = @project_datum.category_id
    new_params["deadline"] = @project_datum.deadline
    new_params["estimated_delivery_time"] = @project_datum.estimated_delivery_time
    new_params["description"] = @project_datum.description
    new_params["project_id"] = @project_datum.project_id
    new_params["website"] = @project_datum.website
    new_params["name"] = @project_datum.name
    new_params["avatar_file_name"] = @project_datum.avatar_file_name

    @project_datum_new = ProjectDatum.new(new_params)

    fund_params = {}
    fund_params["user_id"] = @user.id
    fund_params["project_id"] = @project.id
    fund_params["amount"] = amount_param[:amount].to_f
    puts fund_params
    @fund = @project.user_fund_projects.new(fund_params)


    if @project_datum_new.save!
      @fund.save!
      redirect_to project_path(@project_datum.project_id), notice: "Thank you for helping! Succesfully donated."
    else
      redirect_to project_path(@project_datum.project_id), alert: "Donation could not been completed."
    end
  end

  private

  def amount_param
    params.require(:user_fund_project).permit(:amount)
  end


end
