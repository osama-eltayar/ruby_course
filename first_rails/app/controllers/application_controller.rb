class ApplicationController < ActionController::Base
    alias_method :current_user, :current_model
    protected 
    rescue_from CanCan::AccessDenied do |exception|
        flash[:notice] = exception.message
        redirect_to articles_path
    end

end
