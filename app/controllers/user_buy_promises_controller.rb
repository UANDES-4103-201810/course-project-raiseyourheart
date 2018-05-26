class UserBuyPromisesController < ApplicationController

  def new
    if current_user.nil?
      @user = User.find_by(first: "Anonymous")
    else
      @user = current_user
    end
    @project = Project.find(params[:project])
    @fund = UserBuyPromise.new
    @promise = Promise.find(params[:promise])
  end

  def create
    if current_user.nil?
      @user = User.find_by(first: "Anonymous")
    else
      @user = current_user
    end
    @project = Project.find(params[:user_buy_promise][:project])
    @project_datum = ProjectDatum.current_project(@project)
    @promise = Promise.find(params[:user_buy_promise][:promise])
    amount_raised = @project_datum.amount_raised + @promise.amount
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

    fund_params = {}
    fund_params["user_id"] = @user.id
    fund_params["promise_id"] = @promise.id
    puts fund_params
    @fund = UserBuyPromise.new(fund_params)

    if @project_datum_new.save!
      @fund.save!
      redirect_to project_path(@project_datum.project_id), notice: "Thank you for helping! Succesfully donated. You will recieve your product"
    else
      redirect_to project_path(@project_datum.project_id), alert: "Donation could not been completed."
    end
  end

private
  def creation_params
    params.require(:user_buy_promise).permit(:project, :promise)
  end

end
