class ProcessController < ApplicationController
  def new
    @roles = Role.all
    @process = UserProcess.new
    respond_with(@process)
  end
  
  def create
    unless params[:recipients].blank?
      @process = UserProcess.new(params[:user_process])
      @process.add_members(params[:recipients]) if @process.save
    end
    #raise params.inspect
  end
end
