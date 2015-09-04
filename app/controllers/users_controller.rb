class UsersController < ApplicationController
	before_action :authorize, except: [:new, :create]
	before_action :correct_user?, only: [:edit, :update, :destroy]

	def new
		@user = User.new
		@user.pessoa = Pessoa.new
		@user.grupo = Grupo.find_by descricao: 'Usuario'
		@grupos = Grupo.all
	end

	def create
		@user = User.new(user_params)
		@user.status = User.status[:ativo]
		@user.grupo = Grupo.find_by descricao: 'Usuario'

		if @user.save
			redirect_to @user.pessoa, notice: "Usuário foi criado com sucesso!"
			sign_in
		else
			render action: :new
		end

	end

	def index
		if current_user.grupo.is_root
			@users = User.all
		else
			@users = User.joins(:grupo).where(grupos: {is_root: false})
		end
	end

	def show
	end

	def edit
		@user = User.find(params[:id])
		@grupos = Grupo.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(login: user_params[:login], password: user_params[:password], password_confirmation: user_params[:password_confirmation], grupo_id: user_params[:grupo_id])
			redirect_to users_path
		else
			render action: :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		sign_out
		redirect_to root_path
	end

	def cancelar
		@user = User.find(params[:id])
		@user.update_attribute(:status, User.statuses[:bloqueado])
		redirect_to users_path
	end

	def ativar
		@user = User.find(params[:id])
		@user.update_attribute(:status, User.statuses[:ativo])
		redirect_to users_path
	end

	private
	
	def user_params
		params.require(:user).permit(:login, :password, :password_confirmation, :status, :grupo_id, :pessoa_attributes => [:nome, :sobrenome])
	end
end