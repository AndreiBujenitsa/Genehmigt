module ApplicationHelper

  def e(text)
    "'#{escape_javascript(text)}'".html_safe
  end

  def hidden;    { :style => "display:none;"       }; end
  def exposed;   { :style => "display:block;"      }; end
  def invisible; { :style => "visibility:hidden;"  }; end
  def visible;   { :style => "visibility:visible;" }; end
  def hidden_if(condiion); condiion ? hidden : {}; end
  
  def form_errors(resource)
    render(:partial => 'shared/errors', :locals => {:resource => resource }).html_safe
  end
end
