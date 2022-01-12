class SessionController < ApplicationController
  def new
    redirect_to root_url if current_user.present?
    @user = User.new
  end

  def create
    if @user = User.find_by_email(user_params[:email])&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      if @user.totp_protected?
        redirect_to totp_auth_url
      else
        redirect_to root_url
      end
    else
      flash.now.alert = 'Invalid email or password'
      @user = User.new(**user_params.slice(:email))
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
