class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  protected
  
    def require_login
      unless @current_user = User.find_by_id(session[:user_id])
        redirect_to login_path
      end
    end
    
    def require_staff(organization = nil)
      unless @current_user.staff?(organization) || @current_user.superuser?
        redirect_to root_path
      end
    end
    
    def require_superuser
      unless @current_user.superuser?
        redirect_to root_path
      end
    end
end
