class ErrorsController < ApplicationController
  def error_404
    # fail PageNotFound
  end

  def error_500
    internal_server_error
  end
end
