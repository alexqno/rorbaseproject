class CreatePermissoes < ActiveRecord::Migration
  def change
    create_table :permissoes do |t|
      t.string :chave
      t.string :descricao
      t.integer :tipo
      t.integer :modulo

      t.timestamps null: false
    end
  end
end
