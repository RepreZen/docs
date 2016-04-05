# Liquid tag takes a parsed json structure and uses it to create an
# HTML menu structure made of nested unordered lists.
#
# The incoming structure should be a list of objects (a single object
# will be treated as a singleton list. Each object should have a
# title property and either an items property or a url property. The
# items property means this item generates a submenu with the given
# title. A url means this item generates a menu item linked to the
# given URL. An item can also have an external property, which if
# true, causes the item to be generated with target="_blank" so
# exercising the item will cause its url to be opened in a new tab.

module Jekyll
  class NavgenTag < Liquid::Tag
    def initialize(tag_name, markup, options)
      @var_name = markup.strip
    end
      
    def render(context) 
      items  = context[@var_name]
      render_items(items)
    end

    def render_items(items)
      if items == nil then
        ""
      else
        item_html = items.map do |item|
          "<li>#{item_text(item)}#{item_submenu(item)}</li>"
        end.join("")
        "<ul>#{item_html}</ul>"
      end
    end

    def item_text(item) 
      url = item['url'] || "#"
      target = item['external'] && 'target="_blank"'
      "<a href=\"#{url}\" #{target}>#{item['title']}</a>"
    end

    def  item_submenu(item)
      render_items(item['items'])
    end
      
  end

  Liquid::Template.register_tag('navgen', NavgenTag)
end
