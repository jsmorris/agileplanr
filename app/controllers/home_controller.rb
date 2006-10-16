class HomeController < ApplicationController

  skip_before_filter :check_authentication,
                     :check_authorization
  
end
