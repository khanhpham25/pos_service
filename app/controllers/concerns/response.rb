module Response
  def json_response object, status = :ok
    render json: object, status: status
  end

  def created_request_response object
    json_response object, :created
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

  def unprocessable_response object
    json_response object, :unprocessable_entity
  end

  def no_content_response object
    json_response object, :no_content
  end
end
