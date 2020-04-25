# require 'digest/sha1'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render plain: params[:user].inspect
    # render plain: user_params.inspect

   
    # render plain: User.create(user_params).inspect
    @user = User.create(user_params)
    # render plain: @user.inspect
    if @user.save
      # render plain: @user.inspect
      flash[:notice]="You signed up successfully"
      flash[:color]= "valid"
    else
      # render plain: @user.inspect
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
    
    
  end
  private
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
  
end
