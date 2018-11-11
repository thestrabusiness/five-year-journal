class SessionsController < ApplicationController
  def new
    render :new, layout: 'landings'
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      update_user_time_zone
      redirect_to entries_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new, layout: 'landings'
    end
  end

  def destroy
    sign_out
    flash[:info] = 'Signed out.'
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
