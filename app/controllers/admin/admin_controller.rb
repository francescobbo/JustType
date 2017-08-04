module Admin
  class AdminController < ApplicationController
    include ActionController::HttpAuthentication::Basic

    layout 'admin'

    before_action :ensure_signin
    before_action :ensure_admin

    skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

    def dashboard
    end

    protected

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      elsif has_basic_credentials?(request)
        @current_user ||= authenticate_with_http_basic { |u, pass| User.authenticate(u, pass) }
      end
    end

    def ensure_signin
      unless current_user
        respond_to do |format|
          format.html { redirect_to admin_signin_path }
          format.json { head :forbidden }
        end
      end
    end

    def ensure_admin
      unless current_user.admin?
        respond_to do |format|
          format.html { redirect_to root_path }
          format.json { head :unauthorized }
        end
      end
    end

    private

    helper_method :default_meta_tags

    def default_meta_tags
      {
        site: 'JustType Admin',
        viewport: 'width=device-width,minimum-scale=1,initial-scale=1'
      }
    end
  end
end
