class SessionsController < ApplicationController

  #
  # Ideally, we'd have a SessionsController that persists data to a
  # Users table, but for simplicity we're only interested in storing
  # the omniauth data somewhere - store it in session hash to keep simple.
  #

  def new
    #
    # NO-OP for simplicity
    #
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