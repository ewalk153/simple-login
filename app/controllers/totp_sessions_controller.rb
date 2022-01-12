class TotpSessionsController < ApplicationController
  def new
    @totp = ROTP::TOTP.new(totp_secret, issuer: User::TOTP_ISSUER)
  end

  def create
    user = current_user
    code = params[:validate_code]
    if user.validate_code(code).present?
      session[:totp_confirmed] = true
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def totp_secret
    current_user.totp_secret
  end
end
