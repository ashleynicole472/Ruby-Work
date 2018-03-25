class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash[:danger] = "Error! Please check login credentials and try again." 
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to login_path
  end
  
end