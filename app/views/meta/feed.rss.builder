xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:webfeeds' => 'http://webfeeds.org/rss/1.0' do
  xml.channel do
    xml.title Settings.site_name
    xml.description I18n.t('meta_tags.home.description')
    xml.link root_url
    xml.tag!('webfeeds:related', nil, layout: 'card', target: 'browser')
    xml.language Settings.language

    articles.each do |article|
      xml.item do
        xml.guid article.id
        xml.title article.title
        xml.author article.author.name
        xml.pubDate article.published_at.to_s
        xml.link article_url(article)

        xml.description do
          xml.cdata!(article.rendered_content)
        end
      end
    end
  end
end
