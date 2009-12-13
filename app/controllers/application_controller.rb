# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include Authentication
  helper :all
  protect_from_forgery
  
  before_filter :login_required

  filter_parameter_logging :password

  layout 'application'

end
