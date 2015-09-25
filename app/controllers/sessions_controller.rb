class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  layout "login"

  def create
  	@user = User.find_by(login: params[:session][:login].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		if @user.ativo?
        sign_in
        if @user.grupo.is_root
          redirect_to users_path
        else
          redirect_to @user.pessoa
        end
      else
        render 'new'
      end
  	else
  		render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end

  def new
  end
end
