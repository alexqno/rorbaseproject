class User < ActiveRecord::Base
	has_secure_password

	belongs_to :pessoa
	belongs_to :grupo

	validates_presence_of :pessoa
	validates_associated :pessoa

	validates :password, presence: true, length: {minimum: 6}
	validates :login, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
	before_save {self.login = login.downcase}

	accepts_nested_attributes_for :pessoa, :reject_if => proc { |pessoa| pessoa['nome'].blank? || pessoa['sobrenome'].blank? }

	enum status: [:ativo, :bloqueado]
end
