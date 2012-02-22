require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js
  
  protect_from_forgery
  before_filter :set_loacle
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:error] = I18n.t(:record_not_found) and redirect_back_or_default
  end
  
  def set_loacle
    I18n.locale = params[:locale]
  end
  
  def redirect_back_or_default
    begin
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end
  end
end
