module ApplicationHelper
  def form_errors(resource)
    render(:partial => 'shared/errors', :locals => {:resource => resource }).html_safe
  end
end
