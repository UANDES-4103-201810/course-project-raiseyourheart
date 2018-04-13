class Medium < ApplicationRecord
  belongs_to :project
  validates :path, :type, presence: true
  validates :path, allow_blank: true, format: {
      with:    /\w+\.(gif|jpg|png|mp4|mpg|avi|mkv)\z/i,
      message: "must reference a GIF, JPG, or PNG image. Or video mp4,mpg,avi,mkv"
  }
end
