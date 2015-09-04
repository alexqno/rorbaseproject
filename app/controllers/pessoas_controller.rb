class PessoasController < ApplicationController
	def show
		@pessoa = Pessoa.find(params[:id])
	end
	
	def edit
		@pessoa = Pessoa.find(params[:id])
	end

	def update
		@pessoa = Pessoa.find(params[:id])
		if @pessoa.update_attributes(pessoa_params)
			redirect_to users_path
		else
			render action: :edit
		end
	end

	private

	def pessoa_params
		params.require(:pessoa).permit(:nome, :sobrenome)
	end
end
