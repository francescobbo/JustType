class ArticlesController < ApplicationController
  def show
    article = Article.visible.friendly.find(params[:slug])

    set_meta_tags(canonical: article_url(article),
                  title: article.title,
                  description: article.meta_description,
                  og: {
                    type: 'article',
                    updated_time: article.updated_at.iso8601
                  },
                  article: {
                    section: article.category&.name || 'Uncategorized',
                    published_time: article.published_at.iso8601,
                    modified_time: article.updated_at.iso8601
                  },
                  'DC.date.issued' => article.published_at.iso8601)

    render locals: {
      article: article
    }
  end
end
