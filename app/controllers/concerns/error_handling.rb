module ErrorHandling
  extend ActiveSupport::Concern

  # Render API error
  def render_json_error(message, status = :bad_request)
    @error = message
    render json: { result: 'error', error: @error }, status: status
  end

  # Bad request error
  def bad_request(e)
    render_json_error e.message
  end

  # Not found error
  def not_found
    render_json_error 'not_found', :not_found
  end

  # Not authorized
  def unauthorized
    render_json_error 'unauthorized', :unauthorized
  end

  # Unexpected state error
  def i_m_a_teapot
    render_json_error 'teapot', 418
  end

  class UnexpectedState < StandardError
  end
end
