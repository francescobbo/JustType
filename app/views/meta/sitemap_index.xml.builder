xml.instruct! :xml, version: '1.0'
xml.tag! 'sitemapindex', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.sitemap do
    xml.loc sitemap_url('pages')
  end

  xml.sitemap do
    xml.loc sitemap_url('articles')
  end
end
