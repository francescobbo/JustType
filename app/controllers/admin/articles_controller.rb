module Admin
  class ArticlesController < AdminController
    def new
      render locals: {
        article: Article.new
      }
    end

    def show
      article = Article.find(params[:id])
    end

    def create
      article = Article.new(article_params)
      article.author = current_user

      # You cannot articlepone drafts!
      article.publish if article.published_at || params['submit_type'] == 'publish'

      if article.save
        redirect_to admin_root_path
      else
        render :new, locals: {
          article: article
        }
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :original_content, :published_at)
    end
  end
end
