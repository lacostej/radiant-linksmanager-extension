# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class LinksManagerExtension < Radiant::Extension
  version "0.1"
  description "Allow to create aliases for internal/external links, allowing to track their clicking, and provide a somewhat predefined URL to a particular resource (e.g. a page attachments)."
  url "http://FIXME.com/link_redirects"
  
  define_routes do |map|
    # is there a way to make combine these 2 connect into one ?
    map.connect '/redirect/:link', :controller  => 'admin/redirect', :action => 'redirect'
    map.connect '/redirect/:link.:extension', :controller  => 'admin/redirect', :action => 'redirect'

    # map.connect 'admin/links_manager/:action', :controller => 'admin/links_manager'
    map.resources :links, :path_prefix => '/admin', :controller  => 'admin/links'
  end
  
  def activate
    admin.tabs.add "Links Manager", "/admin/links", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    admin.tabs.remove "Links Manager"
  end
  
end
