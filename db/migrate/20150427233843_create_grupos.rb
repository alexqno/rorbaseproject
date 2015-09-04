class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.integer :status
      t.string :descricao

      t.timestamps null: false
    end
  end
end
