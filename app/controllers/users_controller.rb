class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to bands_url
      # render :show
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end



  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
