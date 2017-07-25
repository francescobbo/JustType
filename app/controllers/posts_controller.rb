class PostsController < ApplicationController
  def show
    post = Post.visible.friendly.find(params[:slug])

    render locals: {
      post: post
    }
  end
end
