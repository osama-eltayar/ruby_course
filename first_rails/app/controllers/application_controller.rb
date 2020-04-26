class ApplicationController < ActionController::Base
    protected 
    def authenticate_user
        if session[:user_id]
            @current_user = User.find session[:user_id]
            # render plain: @current_user.inspect
            return true	
        else
            redirect_to(:controller => 'sessions', :action => 'login')
            return false
        end
    end
    def save_login_state
        if session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'profile')
            return false
        else
            return true
        end
    end

    def geust_user
        if session[:user_id]
            @current_user = User.find session[:user_id]	
        else
            @current_user = nil
        end
    end

end
