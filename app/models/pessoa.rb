class Pessoa < ActiveRecord::Base
	has_one :user

	validates :nome, presence: true, length: {minimum: 2}
	validates :sobrenome, presence: true, length: {minimum: 2}
end
