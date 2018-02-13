class UsersController < ApplicationController
  def new
    @user = User.new
    render :new, layout: 'landings'
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to entries_path
    else
      flash.now[:danger] = 'Make sure you fill out all required fields!'
      render :new, layout: 'landings'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
