module Response
  def json_response object, status = :ok
    render json: object, status: status
  end

  def created_request_response object
    json_response object, status: :created
  end

  def bad_request_response object
    json_response object, :bad_request
  end

  def not_found_response object
    json_response object, :not_found
  end

  def unauthorized_response object
    json_response object, :unauthorized
  end
end
