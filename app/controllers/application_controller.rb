require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js
  
  protect_from_forgery
  before_filter :set_loacle
  
  def set_loacle
    I18n.locale = params[:locale]
  end
end
