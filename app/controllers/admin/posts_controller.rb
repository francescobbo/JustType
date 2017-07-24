module Admin
  class PostsController < AdminController
    def new
      render locals: {
        post: Post.new
      }
    end

    def create
      post = Post.new(post_params)
      post.author = current_user

      # You cannot postpone drafts!
      post.publish if post.published_at || params['submit_type'] == 'publish'

      if post.save
        redirect_to admin_root_path
      else
        render :new, locals: {
          post: post
        }
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :original_content, :published_at)
    end
  end
end
