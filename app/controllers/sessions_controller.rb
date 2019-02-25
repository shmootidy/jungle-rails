class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
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
