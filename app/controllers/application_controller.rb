class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def default_meta_tags
    {
      viewport: 'width=device-width,minimum-scale=1,initial-scale=1'
    }
  end
end
