class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "grupo_permissoes", "grupos", name: "grupo_permissoes_grupo_id_fk"
    add_foreign_key "grupo_permissoes", "permissoes", name: "grupo_permissoes_permissao_id_fk"
  end
end
