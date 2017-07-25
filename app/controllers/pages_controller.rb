class PagesController < ApplicationController
  def index
    render locals: {
      posts: Post.visible.all
    }
  end
end
