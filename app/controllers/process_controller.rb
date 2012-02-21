class ProcessController < ApplicationController
  def new
    @roles = Role.all
    @process = UserProcess.new
    #respond_with(@process)
  end
  
  def create
  
  end
end
