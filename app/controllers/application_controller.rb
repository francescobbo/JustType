class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :default_meta_tags

  def default_meta_tags
    {
      site: Settings.site_name,
      reverse: true,
      viewport: 'width=device-width,minimum-scale=1,initial-scale=1',
      'theme-color': Settings.theme_color,
      og: {
        type: 'website',
        url: request.original_url,
        title: "#{meta_tags.meta_tags[:title]} | #{Settings.site_name}",
        description: meta_tags.meta_tags[:description],
        locale: Settings.locale,
        site_name: Settings.site_name
      },
      twitter: {
        title: "#{meta_tags.meta_tags[:title]} | #{Settings.site_name}",
        description: meta_tags.meta_tags[:description],
        card: 'summary'
      }
    }
  end
end
