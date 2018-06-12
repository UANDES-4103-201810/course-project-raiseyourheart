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
      if @user.update(email: params[:email])
        @project = Project.find(params[:project])
        @promise = Promise.find(params[:promise])
      else return redirect_to project_path(Project.find(params[:project])), alert: @user.errors.full_messages.to_sentence
      end
    else
      @user = current_user
      @project = Project.find(params[:user_buy_promise][:project])
      @promise = Promise.find(params[:user_buy_promise][:promise])
    end
    fund_params = {}
    fund_params["user_id"] = @user.id
    fund_params["promise_id"] = @promise.id
    @fund = UserBuyPromise.new(fund_params)
    puts fund_params
    if @fund.save
      @fund.set_confirmation_token
      @fund.save(validate: false)
      UserBuyPromiseMailer.promise_confirmation(@fund).deliver_now
      @user.update(email: "Anonymous@Anonymous.cl")
      redirect_to project_path(@project), notice: "Please confirm your fund, an email has been sent to your address."
    else
      redirect_to project_path(@project), alert: "Donation could not been completed."
    end
  end

  def confirm_promise
    fund = UserBuyPromise.find_by_confirm_token(params[:token])
    if fund
      fund.validate_email
      fund.save(validate: false)
      @promise= Promise.find(fund.promise_id)
      @project_datum = ProjectDatum.current_project(@promise.project_id)
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
      @project_datum_new.save!
      redirect_to project_path(@project_datum.project_id), notice: "Thanks for your help! Succesfully donated"
    else
      flash[:error] = "Sorry. Fund does not exist"
      redirect_to root_url
    end
  end

private
  def creation_params
    params.require(:user_buy_promise).permit(:project, :promise)
  end

end
