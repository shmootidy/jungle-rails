class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.now[:alert] = 'Log in unsuccessful'
      render new_session_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
