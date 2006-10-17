class AdminController < ApplicationController

  def signin
    if request.post?
      session[:user] = User.authenticate(params[:username], params[:password]).id
      redirect_to :action => session[:intended_action], 
                  :controller => session[:intended_controller]
    end
    rescue
    flash[:notice] = "Username or password invalid"
    redirect_to :action => "signin", :controller => "admin"
  end
  
  def signout
    session[:user] = nil
    flash[:notice] = "Signed out"
    redirect_to home_url
  end
  
end