module ApplicationHelper
	#add ability to check navigation per the following link:
	#http://stackoverflow.com/questions/3705898/best-way-to-add-current-class-to-nav-in-rails-3

	def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def nav_link(link_text, link_path)
  class_name = current_page?(link_path) ? 'current' : ''

  content_tag(:li, :class => class_name) do
    link_to link_text, link_path
  end
end

end
