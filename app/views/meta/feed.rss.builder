xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:webfeeds' => 'http://webfeeds.org/rss/1.0' do
  xml.channel do
    xml.title Settings.site_name
    xml.description I18n.t('meta_tags.home.description')
    xml.link root_url
    xml.tag!('webfeeds:related', nil, layout: 'card', target: 'browser')
    xml.language Settings.language

    posts.each do |post|
      xml.item do
        xml.guid post.id
        xml.title post.title
        xml.author post.author.name
        xml.pubDate post.published_at.to_s
        xml.link post_url(post)

        xml.description do
          xml.cdata!(post.rendered_content)
        end
      end
    end
  end
end
