class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.is_mentor
        redirect_to "/users/#{@user.id}/edit"
      else
        redirect_to '/'
      end
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @skills = Skill.all
    @user = User.find(session[:user_id])
  end

  def update
    params[:mentor_skills].each do |skill_id|

    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :full_name, :email, :password,
        :password_confirmation, :is_mentor, :phone)
    end
end
