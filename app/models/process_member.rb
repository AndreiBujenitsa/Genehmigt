class ProcessMember < ActiveRecord::Base
  belongs_to :role
  after_create :send_invitation
  
  
  def token_url
    "http://#{AppConfig.site_name}/process/#{Crypto.encrypt("#{email}:#{role_id}:#{process_id}")}"
  end
  
  protected
  def send_invitation
    UserMailer.invitation(self).deliver
  end
end
