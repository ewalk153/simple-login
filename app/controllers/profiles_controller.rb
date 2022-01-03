class ProfilesController < ApplicationController
  before_action :auth_required

  def show
    @profile = current_user.dup
  end

  def update
    @profile = current_user.dup
    if current_user.update(profile_params.slice(:name))
      flash.alert = "Update successful."
      redirect_to profile_url
    else
      flash.alert = "Update prob."
      render :show, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :current_password, :password, :password_confirmation)
  end
end
