module Admin
  class AdminController < ApplicationController
    layout 'admin'

    before_action :ensure_signin
    before_action :ensure_admin

    def dashboard
    end

    protected

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def ensure_signin
      redirect_to admin_signin_path unless current_user
    end

    def ensure_admin
      redirect_to root_path unless current_user.admin?
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
