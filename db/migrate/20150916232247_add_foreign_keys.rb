class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "users", "grupos", name: "users_grupo_id_fk"
    add_foreign_key "users", "pessoas", name: "users_pessoa_id_fk"
  end
end
