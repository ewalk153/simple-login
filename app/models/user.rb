class User < ApplicationRecord
  TOTP_ISSUER = "My Cool Service"
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  encrypts :totp_secret

  def validate_code(code)
    totp = ROTP::TOTP.new(totp_secret, issuer: TOTP_ISSUER)
    result = totp.verify(code)
    Time.at(result) if result
  end

  def totp_protected?
    totp_secret.present?
  end
end
