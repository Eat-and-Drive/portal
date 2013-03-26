module LayoutHelper
  def iconize(body, icon)
    (content_tag(:i, nil, :class => "icon-#{icon}") + ' ' + body).html_safe
  end
end
