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
    fund_params = {}
    if current_user.nil?
      @user = User.find_by(first: "Anonymous")
      if @user.update(email: params[:email])
      else return redirect_to project_path(Project.find(params[:project_id])), alert: @user.errors.full_messages.to_sentence
      end
      fund_params["amount"] = params[:amount].to_f
    else
      @user = current_user
      fund_params["amount"] = amount_param[:amount].to_f
    end
    @project = Project.find(params[:project_id])
    fund_params["user_id"] = @user.id
    fund_params["project_id"] = @project.id
    puts fund_params
    @fund = @project.user_fund_projects.new(fund_params)


    if @fund.save
      @fund.set_confirmation_token
      @fund.save(validate: false)
      UserFundProjectMailer.fund_confirmation(@fund).deliver_now
      @user.update(email: "Anonymous@Anonymous.cl")
      redirect_to project_path(@fund.project_id), notice: "Please confirm your fund, an email has been sent to your address."
    else
      redirect_to project_path(@project_datum.project_id), alert: "Donation could not been completed."
    end
  end

  def confirm_email
    fund = UserFundProject.find_by_confirm_token(params[:token])
    if fund
      fund.validate_email
      fund.save(validate: false)
      @project_datum = ProjectDatum.current_project(fund.project_id)
      amount_raised = @project_datum.amount_raised + fund.amount.to_f
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
      new_params["avatar"] = @project_datum.avatar
      new_params["abstract"] = @project_datum.abstract
      @project_datum_new = ProjectDatum.new(new_params)
      @project_datum_new.save!
      redirect_to project_path(fund.project), notice: "Thanks for your help! Succesfully donated"
    else
      flash[:error] = "Sorry. Fund does not exist"
      redirect_to root_url
    end
  end

  private

  def amount_param
    params.require(:user_fund_project).permit(:amount)
  end


end
