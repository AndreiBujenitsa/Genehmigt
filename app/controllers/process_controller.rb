class ProcessController < ApplicationController
  before_filter :get_roles
  
  def new
    @process = UserProcess.new
    respond_with(@process)
  end
  
  def create
    @process = UserProcess.new(params[:user_process])
    @process.save
    
    respond_with(@process)
  end
  
  protected
  def get_roles
    @roles = Role.all
  end
end
