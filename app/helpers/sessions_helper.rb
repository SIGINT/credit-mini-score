module SessionsHelper

  #
  # Returns boolean whether session is currently authenticated (via Facebook)
  #
  def connected_to_fb?
    session[:omniauth].nil?
  end

end
