class ProjectDataController < ApplicationController

  def update
    @project_datum=ProjectDatum.find(params[:id])
    new_params = Hash.new
    if project_data_params["amount_raised"].nil?
      new_params["amount_raised"] = @project_datum.amount_raised
    else
      new_params["amount_raised"] = project_data_params["amount_raised"]
    end
    if project_data_params["visible"].nil?
      new_params["visible"] = @project_datum.visible
    else
      new_params["visible"] = project_data_params["visible"]
    end
    if project_data_params["goal"].nil?
      new_params["goal"] = @project_datum.goal
    else
      new_params["goal"] = project_data_params["goal"]
    end
    if project_data_params["category_id"].nil?
      new_params["category_id"] = @project_datum.category_id
    else
      new_params["category_id"] = project_data_params["category_id"]
    end
    if project_data_params["deadline"].nil?
      new_params["deadline"] = @project_datum.deadline
    else
      new_params["deadline"] = project_data_params["deadline"]
    end
    if project_data_params["estimated_delivery_time"].nil?
      new_params["estimated_delivery_time"] = @project_datum.estimated_delivery_time
    else
      new_params["estimated_delivery_time"] = project_data_params["estimated_delivery_time"]
    end
    if project_data_params["description"].nil?
      new_params["description"] = @project_datum.description
    else
      new_params["description"] = project_data_params["description"]
    end
    if project_data_params["project_id"].nil?
      new_params["project_id"] = @project_datum.project_id
    else
      new_params["project_id"] = project_data_params["project_id"]
    end
    if project_data_params["website"].nil?
      new_params["website"] = @project_datum.website
    else
      new_params["website"] = project_data_params["website"]
    end
    if project_data_params["name"].nil?
      new_params["name"] = @project_datum.name
    else
      new_params["name"] = project_data_params["name"]
    end
    if project_data_params["avatar_file_name"].nil?
      new_params["avatar_file_name"] = @project_datum.avatar_file_name
    else
      new_params["avatar_file_name"] = project_data_params["avatar_file_name"]
    end

    @project_datum_new = ProjectDatum.new(new_params)

    if @project_datum_new.save!
      redirect_to project_path(@project_datum.project_id), notice: "Project Updated!."
    else
      redirect_to project_path(@project_datum.project_id), alert: "Project could not be Updated."
    end
    # end
  end


  private

  def project_data_params
    params.require(:project_datum).permit(:amount_raised, :visible, :goal, :category_id, :deadline, :estimated_delivery_time, :description, :project_id, :website, :name, :avatar_file_name)
  end

end
