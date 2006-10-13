class AdminController < ApplicationController

  before_filter :check_authentication, :except => [:signin]
  
  def check_authentication
    unless session[:user]
      session[:intended_action] = action_name
      session[:intended_controller] = controller_name
      redirect_to :action => "signin"
    end
  end

  def signin
    if request.post?
      session[:user] = User.authenticate(params[:username], params[:password]).id
      redirect_to :action => session[:intended_action], 
                  :controller => session[:intended_controller]
    end  
  end
  
  def signout
    session[:user] = nil
    redirect_to home_url
  end
  
end