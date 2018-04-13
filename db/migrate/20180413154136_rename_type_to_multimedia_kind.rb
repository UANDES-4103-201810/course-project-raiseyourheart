class RenameTypeToMultimediaKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :type, :multimedia_kind
  end
end