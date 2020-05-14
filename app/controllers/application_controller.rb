class ApplicationController < ActionController::Base
  include Pundit
  include Frondit

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'Not authorized' }
      format.json { render json: { error: 'Not authorized' }, status: :unauthorized }
      format.text { render json: { error: 'Not authorized' }, status: :unauthorized }
    end
  end
end
