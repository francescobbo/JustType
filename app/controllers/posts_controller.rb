class PostsController < ApplicationController
  def show
    post = Post.visible.friendly.find(params[:slug])

    # Missing: description
    set_meta_tags({
      canonical: post_url(post),
      title: post.title,
      og: {
        type: 'article',
        updated_time: post.updated_at.iso8601
      },
      article: {
        section: "Uncategorized",
        published_time: post.published_at.iso8601,
        modified_time: post.updated_at.iso8601
      },
      "DC.date.issued" => post.published_at.iso8601
    })

    render locals: {
      post: post
    }
  end
end
