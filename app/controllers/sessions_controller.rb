class SessionsController < ApplicationController

  def new
  end

  def create
    session[:omniauth] = env['omniauth.auth']
    flash[:success] = 'Successfully authenticated and created session !'
    redirect_to root_path
  end

  def destroy
    session[:omniauth] = nil
    flash[:danger] = 'Issues encountered while trying to create session...'
    redirect_to root_path
  end

end