class PromisesController < ApplicationController
  before_action :require_owner, :except => [:show, :new, :create, :index]

  def new
    @promise = Promise.new
  end

  def edit
    @promise = Promise.find(params[:id])
  end

  def update
    @promise = Promise.find(params[:id])
    @project = @promise.project

    if @promise.update(promise_params)
      redirect_to @project, notice: "Promise updated succesfully."
    else
      redirect_to @project, alert: "Promise couldn't be updated: "+ @promise.errors.fullmessages.to_sentence
    end
  end

  def create

    @project = Project.find(params[:promise][:project])
    hash_params = {}
    hash_params["description"] = params[:promise][:description]
    hash_params["delivery_time"] = params[:promise][:delivery_time]
    hash_params["amount"] = params[:promise][:amount]
    hash_params["avatar"] = params[:promise][:avatar]
    hash_params["project_id"] = params[:promise][:project]
    hash_params["user_id"] = params[:promise][:user]
    @promise = Promise.new(hash_params)

    if @promise.save
      redirect_to @project, notice: "Succesful creation!"
    else
      redirect_to @project, alert: "Error: "+@promise.errors.full_messages.to_sentence
    end
  end


  def destroy
    @promise = Promise.find(params[:id])
    @project=@promise.project
    @promise.destroy
    redirect_to @project, notice: "Promise was successfully destroyed."

  end


  def promise_params
    params.require(:promise).permit(:description, :delivery_time, :amount, :avatar, :project, :user)
  end

  def require_owner
    @promise=Promise.find(params[:id])
    @user = current_user
    unless @promise.user == @user || current_user_admin?
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end

end
