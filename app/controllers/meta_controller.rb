class MetaController < ApplicationController
  def robots
    render formats: [:txt]
  end

  def manifest
  end

  def feed
    render locals: {
      posts: Post.visible.all
    }
  end

  def sitemap_index
  end

  def sitemap
    case params[:type]
    when 'pages'
      urls = [root_url]
    when 'posts'
      urls = Post.visible.map { |post| post_url(post) }
    end

    render locals: {
      urls: urls
    }
  end
end
