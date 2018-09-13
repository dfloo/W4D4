class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:users][:email],
      params[:users][:password]
    )

    unless user.nil?
      log_in_user!(user)
      render json: user 
    else
      flash.now[:errors] = ["Invalid login credentials!!!"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
