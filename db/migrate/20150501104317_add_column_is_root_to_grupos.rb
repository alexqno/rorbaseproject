class AddColumnIsRootToGrupos < ActiveRecord::Migration
  def change
    add_column :grupos, :is_root, :boolean, default: false
  end
end
