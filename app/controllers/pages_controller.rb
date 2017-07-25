class PagesController < ApplicationController
  def index
    set_meta_tags(I18n.t('meta_tags.home'))

    render locals: {
      posts: Post.visible.all
    }
  end
end
