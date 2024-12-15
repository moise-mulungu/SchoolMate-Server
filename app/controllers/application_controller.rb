class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    Rails.logger.debug "Token: #{token}"
    if token
      begin
        decoded_token = FirebaseAdmin.auth.verify_id_token(token)
        Rails.logger.debug "Decoded Token: #{decoded_token}"
        @current_user = decoded_token[:uid]
      rescue => e
        Rails.logger.error "Authentication error: #{e.message}"
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    else
      Rails.logger.error "No token provided"
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
