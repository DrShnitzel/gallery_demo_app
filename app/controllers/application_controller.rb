class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ErrorHandling
  rescue_from 'ActiveRecord::RecordNotUnique', with: :bad_request
  rescue_from 'ActiveRecord::RecordInvalid', with: :bad_request
  rescue_from 'ActiveRecord::RecordNotFound', with: :not_found
  rescue_from 'ErrorHandling::UnexpectedState', with: :i_m_a_teapot
  rescue_from 'UserExceptions::WrongPassword', with: :bad_request
  rescue_from 'UserExceptions::Unauthorized', with: :unauthorized
  rescue_from 'ActiveModel::StrictValidationFailed', with: :bad_request

  def auth
    @user = User.find_by(token: params[:token])
    fail UserExceptions::Unauthorized unless @user
  end
end
