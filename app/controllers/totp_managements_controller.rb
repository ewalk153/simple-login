class TotpManagementsController < ApplicationController
  before_action :auth_required
  def new
  end

  def create
    session[:totp_secret] = ROTP::Base32.random
    redirect_to show_totp_managements_url
  end

  def update
    render :new unless session[:totp_secret].present?
    user = current_user

    user.totp_secret = session[:totp_secret]
    code = params[:validate_code]
    if user.validate_code(code).present?
      user.save
      session[:totp_secret] = nil
      flash.notice = "Authentication setup complete."
      redirect_to show_totp_managements_url
    else
      flash.now.alert = 'Authentication validation failure.'
      user.totp_secret = nil
      @totp = ROTP::TOTP.new(totp_secret, issuer: User::TOTP_ISSUER)
      render :show, status: :unprocessable_entity
    end
  end

  def show
    @totp = ROTP::TOTP.new(totp_secret, issuer: User::TOTP_ISSUER)
  end

  def destroy
    user = current_user
    user.totp_secret = nil
    user.save

    flash.notice = "Authentication removed."
    redirect_to new_totp_managements_url
  end

  private

  def totp_secret
    session[:totp_secret] || current_user.totp_secret
  end
end
