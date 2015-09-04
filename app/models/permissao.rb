class Permissao < ActiveRecord::Base
	has_many :grupo_permissoes
	has_many :grupos, :through => :grupo_permissoes

	enum tipo: [:simnao, :acesso]
	enum modulo: [:usuario]
end
