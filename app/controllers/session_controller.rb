class SessionController < ApplicationController
  def new
  end

  def create # se connecter 
    user = User.find_by(email: params[:email]) # trouver si user est ds la BDD
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = 'Log in successful'
      redirect_to gossips_path 
    end
  end

  def destroy # deconnecter 
    session.delete(:user_id) #sortir de la session 
    flash[:success] = 'Log out successful'
    redirect_to gossips_path 
  end 
end
