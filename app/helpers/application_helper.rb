module ApplicationHelper
  def markdown(text)
    GitHub::Markdown.render_gfm(text).html_safe unless text.blank?
  end
end
