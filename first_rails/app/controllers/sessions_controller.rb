class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :profile, :setting]
  before_action :save_login_state, :only => [:login, :login_attempt]
  
  def login
    render "login"
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    # render plain: authorized_user.inspect
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:controller => 'sessions', :action => 'profile')
      # render plain: authorized_user.inspect
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      # render "login"	
      render plain: "nono"
    end
  end

  def home
  end

  def profile
    render "profile"
  end

  def setting
  end

  def logout
    # render plain: @current_user.inspect
    session[:user_id] = nil
    @current_user = nil
    redirect_to(:controller => 'sessions', :action => 'login')
  end
end
