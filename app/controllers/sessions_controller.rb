class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  layout "login"

  def create
  	@user = User.find_by(login: params[:session][:login].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		if @user.ativo?
        sign_in
  		  puts "===================="
        puts "ATIVO"
        puts "===================="
        if @user.grupo.is_root
          puts "===================="
          puts "EH ROOT"
          puts "===================="
          redirect_to users_path
        else
          puts "===================="
          puts "NAO EH ROOT"
          puts "===================="
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
