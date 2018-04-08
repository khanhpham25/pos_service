require "jwt"

class Jwt
  EXPIRATION = 7.days.from_now.to_i

  class << self
    def encode payload
      payload["expiration"] = EXPIRATION
      JWT.encode payload, Rails.application.secrets.secret_key_base
    end

    def decode payload
      JWT.decode payload, Rails.application.secrets.secret_key_base
    end

    def not_expired payload
      Time.at(payload["expiration"]) > Time.zone.now
    end
  end

  def authenticate? request
    return unauthorized unless (valid_payload = payload(request))

    unless Jwt.not_expired(valid_payload.first) ||
      load_current_user!(valid_payload.first)

      return unauthorized
    end
    true
  end

  def unauthorized
    nil
  end

  private

  def payload request = nil
    auth_header = request.headers["AUTH-TOKEN"]
    token = auth_header.split(" ").last
    Jwt.decode(token)
  rescue
    nil
  end

  def load_current_user! valid_payload
    @current_user = User.find_by(valid_payload["user_id"])
  rescue
    nil
  end
end
