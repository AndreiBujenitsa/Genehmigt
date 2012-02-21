class ProcessController < ApplicationController
  def new
    @process = UserProcess.new
    #respond_with(@process)
  end
  
  def create
  
  end
end
