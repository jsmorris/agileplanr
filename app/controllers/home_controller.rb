class HomeController < ApplicationController

  skip_before_filter :check_authentication, :check_authorization
  
  def index
    render :text => "A page that doesn't require a signin or any rights"
  end
  
end
