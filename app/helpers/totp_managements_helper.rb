module TotpManagementsHelper
  def qr_code_svg(user, totp)
    provisioned = totp.provisioning_uri(user.email)
    qrcode = RQRCode::QRCode.new(provisioned)
    svg = qrcode.as_svg(
    ).html_safe
  end
end
