class AddColumnPessoaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pessoa_id, :integer
  end
end
