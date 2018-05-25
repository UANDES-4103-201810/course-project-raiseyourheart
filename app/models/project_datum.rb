class ProjectDatum < ApplicationRecord
  has_attached_file :avatar, styles: {medium: "50x50>", thumb: "10x10>"}, default_url: "placeholder.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  belongs_to :project
  # belongs_to :user

  validates :amount_raised, numericality: { greater_than_or_equal_to: 0}
  validates :goal, numericality: { greater_than_or_equal_to: 0}
  validates :description, length: { minimum: 50 }
  validates :abstract, length: { minimum: 50, maximum: 150 }
  validates :deadline, :estimated_delivery_time, presence: true

  def self.current_project(project)
    project_data = where(project: project)
    if @project.nil?
      current_project = project_data.max_by(&:id)
    else
      current_project = "Ninguno"
    end
  end
end
