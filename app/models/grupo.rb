class Grupo < ActiveRecord::Base
	has_many :grupo_permissoes
	has_many :permissoes, :through => :grupo_permissoes
	has_many :users

	enum status: [:ativo, :bloqueado]
end
