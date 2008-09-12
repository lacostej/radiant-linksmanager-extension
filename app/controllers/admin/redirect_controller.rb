class Admin::RedirectController < ApplicationController
  # GET /admin/links
  # GET /admin/links.xml
  def redirect
    name = params[:link]
    if params[:extension] != nil
      name += '.' + params[:extension]
    end
    link = Link.find_by_name(name)
    url = link.url
    redirect_to url
  end
end
