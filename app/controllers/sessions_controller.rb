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
      login(user)
      redirect_to bands_url
    else
      flash[:errors] = ["Invalid login credentials!!!"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to bands_url
  end

end
