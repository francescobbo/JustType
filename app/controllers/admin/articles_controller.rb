module Admin
  class ArticlesController < AdminController
    def index
      articles = Article.all
      render locals: {
        articles: articles
      }
    end

    def new
      render locals: {
        article: Article.new
      }
    end

    def show
      article = Article.find(params[:id])

      render locals: {
        article: article
      }
    rescue ActiveRecord::RecordNotFound
      request.format.json? ? head(:not_found) : raise
    end

    def create
      article = Article.new(article_params)
      article.author = current_user

      # You cannot articlepone drafts!
      article.publish if article.published_at || params['submit_type'] == 'publish'

      if article.save
        respond_to do |format|
          format.html { redirect_to admin_root_path }
          format.json { render :show, locals: { article: article }, status: :created }
        end
      else
        respond_to do |format|
          format.html { render :new, locals: { article: article } }
          format.json { head :unprocessable_entity }
        end
      end
    end

    def edit
      article = Article.find(params[:id])

      render locals: {
        article: article
      }
    end

    def update
      article = Article.find(params[:id])

      article.publish if article.published_at || params['submit_type'] == 'publish'

      if article.update(article_params)
        respond_to do |format|
          format.html { redirect_to admin_root_path }
          format.json { render :show, locals: { article: article }, status: :created }
        end
      else
        respond_to do |format|
          format.html { render :new, locals: { article: article } }
          format.json { head :unprocessable_entity }
        end
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :meta_description, :original_content, :published_at)
    end
  end
end
