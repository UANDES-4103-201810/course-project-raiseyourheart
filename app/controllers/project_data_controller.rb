class ProjectDataController < ApplicationController

  def update
    @project_datum=ProjectDatum.find(params[:id])
    new_params=Hash.new
    new_params["amount_raised"]=@project_datum.amount_raised
    new_params["visible"]=project_data_params["visible"]
    new_params["goal"]=project_data_params["goal"]
    new_params["category_id"]=@project_datum.category_id
    new_params["deadline"]=project_data_params["deadline"]
    new_params["estimated_delivery_time"]=project_data_params["estimated_delivery_time"]
    new_params["description"]=project_data_params["description"]
    new_params["project_id"]=@project_datum.project_id
    new_params["website"]=project_data_params["website"]
    new_params["name"]=project_data_params["name"]
    new_params["avatar_file_name"]=project_data_params["avatar_file_name"]
    @project_datum_new=ProjectDatum.new(new_params)

    if @project_datum_new.save
      redirect_to project_path(@project_datum.project_id), notice: "Project Updated!."
    else
      redirect_to project_path(@project_datum.project_id), alert: "Error: Project couldn't be updated."
    end
    # end
  end


  private
  def project_data_params
    params.permit(:amount_raised, :visible, :goal, :category_id, :deadline, :estimated_delivery_time, :description,:project_id, :website, :name, :avatar_file_name)
  end

end
