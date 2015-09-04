class CreateGrupoPermissoes < ActiveRecord::Migration
  def change
    create_table :grupo_permissoes do |t|
      t.integer :grupo_id
      t.integer :permissao_id
      t.string :valor

      t.timestamps null: false
    end
  end
end
