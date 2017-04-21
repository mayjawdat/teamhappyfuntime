class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.password == session_params[:password_confirmation]
      login(@user)
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password_confirmation)
  end
end
