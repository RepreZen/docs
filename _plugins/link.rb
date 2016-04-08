# Liquid tag locates an article slug in the content_tree data, and
# constructs an asciidoc link construct including the full URL and the
# page title. If a content item does not define a slug and it's an
# internal article, then its url, stripped of its surrounding
# slashes, is used.
module Jekyll
  class LinkTag  < Liquid::Tag
    def initialize(tag_name, markup, options)
      @slug = markup.strip
      @permalink = "/#{@slug}/"
    end
      
    def render(context) 
      site = context.find_variable('site')
      baseurl = site['baseurl']
      content_areas  = site['data']['content_tree']['areas']
      content_areas.each do |area|
        area['articles'].each do |article|
          if article['slug'] == @slug || (article['type'] == 'internal' && article['url'] == @permalink) then
            title = article['fullTitle'] || article['title']
            url = article['type'] == 'internal' ? "#{baseurl}#{article['url']}" : article['url']
            return "link:#{url}[#{title}]"
          end
        end
      end
      return "link:#[Unknown Page]"
    end

  end

  Liquid::Template.register_tag('link', LinkTag)
end
