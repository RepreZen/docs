# Liquid tag locates an article slug in the content_tree data, and
# constructs an asciidoc link construct including the full URL and the
# page title. If a content item does not define a slug and it's an
# internal article, then its url, stripped of its surrounding
# slashes, is used.
#
# linkx is an alternative tag that acts like link but does not fill in
# the article title. Use it like this:
#
# Look {%linkx cg_intro%}[here] for an introduction...
#
module Jekyll
  class LinkTag  < Liquid::Tag
    def initialize(tag_name, markup, options)
      match = markup.match(/^\s*([^#\s]+)(#(\S+))?\s*$/)
      @slug = match[1]
      @fragment=match[2]
      @permalink = "/#{@slug}/"
      @notext = tag_name == "linkx"
    end
      
    def render(context) 
      site = context.find_variable('site')
      baseurl = site['data']['baseurl']
      content_areas  = site['data']['content_tree']['areas']
      content_areas.each do |area|
        area['articles'].each do |article|
          if article['slug'] == @slug || (article['type'] == 'internal' && article['url'] == @permalink) then
            title = "[#{article['fullTitle'] || article['title']}]" unless @notext
            new_window = article['new_window'] || (article['type'] == 'external')
            caret = "^" if new_window
            url = article['type'] == 'internal' ? "#{baseurl}#{article['url']}" : article['url']
            url = url+@fragment if @fragment
            return "link:#{url}#{title}#{caret}"
          end
        end
      end
      return "link:#[Unknown Page]"
    end

  end

  Liquid::Template.register_tag('link', LinkTag)
  Liquid::Template.register_tag('linkx', LinkTag)
end
