class SessionsController < ApplicationController
  def new
    render :new, layout: 'landings'
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to entries_path
    else
      render :new, layout: 'landings', notice: 'Invalid email or password.'
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path, notice: 'Signed out.'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
