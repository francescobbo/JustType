class PagesController < ApplicationController
  def index
    set_meta_tags(I18n.t('meta_tags.home'))
    set_meta_tags(canonical: root_url)

    render locals: {
      articles: Article.visible.all
    }
  end
end
