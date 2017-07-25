class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :default_meta_tags

  def default_meta_tags
    {
      site: Settings.site_name,
      viewport: 'width=device-width,minimum-scale=1,initial-scale=1'
    }
  end
end
