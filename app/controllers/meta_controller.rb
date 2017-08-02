class MetaController < ApplicationController
  def robots
    render formats: [:txt]
  end

  def manifest
  end

  def feed
    render locals: {
      articles: Article.visible.all
    }
  end

  def sitemap_index
  end

  def sitemap
    case params[:type]
    when 'pages'
      urls = [root_url]
    when 'articles'
      urls = Article.visible.map { |article| article_url(article) }
    end

    render locals: {
      urls: urls
    }
  end
end
