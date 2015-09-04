module SessionsHelper
	def sign_in
		session[:user_id] = @user.id
	end

	def sign_out
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def block_access
		if current_user.present?
			redirect_to users_path
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def tem_permissao(chave)
		permissao = Permissao.find_by(chave: chave)
		gp = current_user.grupo.grupo_permissoes.where(permissao_id: permissao.id)
		if (permissao.tipo == Permissao.tipos[:acesso] && gp.valor != "A")
			true
		elsif (permissao.tipo == Permissao.tipos[:simnao] && gp.valor != "S")
			true
		else
			false
		end
	end

	def eval_permissao(chave, valor)
		permissao = Permissao.find_by(chave: chave)
		gp = current_user.grupo.grupo_permissoes.where(permissao_id: permissao.id)
		if (gp.valor != valor)
			true
		else
			false
		end
	end

end