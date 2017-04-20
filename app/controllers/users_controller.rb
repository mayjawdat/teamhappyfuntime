class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p "* " * 60
    p params
    p "* " * 60
    p user_params
    p "* " * 60

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :full_name, :email, :password,
        :password_confirmation, :is_mentor, :phone)
    end
end
