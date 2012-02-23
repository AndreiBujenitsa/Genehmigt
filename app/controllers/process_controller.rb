class ProcessController < ApplicationController
  before_filter :get_roles
  
  def new
    #UserProcess.find(:all).each{|u| u.destroy}
    @process = UserProcess.new
    respond_with(@process)
  end
  
  def create
    @process = UserProcess.new(params[:user_process])
    if @process.save
      token_str = @process.get_owner_token_url
      redirect_to "/process/#{token_str}"
    end
  end
  
  def show
    param = UserProcess.decrypt_token_url(params[:id])
    @process = UserProcess.find(param[:process_id])
    respond_with(@process)
  end
  
  def destroy
    @process = UserProcess.find(params[:id]).destroy
  end
  
  def upload
    attachment = ProcessAttachment.new
    attachment.attachment = params["files"][0]
    attachment.save
    viewHelper = Object.new.extend(ActionView::Helpers::NumberHelper)
    render :json => ['name' => params["files"][0].original_filename, 'size' => viewHelper.number_to_human_size(File.size(params["files"][0].tempfile)), 'id' => rand(1000)]
  end
  
  protected
  def get_roles
    @roles = Role.all
  end
end
