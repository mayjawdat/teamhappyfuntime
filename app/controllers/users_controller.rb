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
        redirect_to "/users/#{@user.id}"
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
      UsersSkill.create(skill_id: skill_id, user_id: current_user.id)
    end
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @profile = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :full_name, :email, :password,
        :password_confirmation, :is_mentor, :phone)
    end
end
