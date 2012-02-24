class ProcessMember < ActiveRecord::Base
  belongs_to :role
  belongs_to :user_process, :foreign_key => :process_id
  after_create :send_invitation
  
  
  def token_url
    "http://#{AppConfig.site_name}/process/#{Crypto.encrypt("#{email}:#{role_id}:#{process_id}")}"
  end
  
  def read_email
    self.update_attributes(:state=>"read")
  end
  
  def html_state
    "<i class='#{I18n.t(:"state_icon_class.#{state}")}'></i> #{I18n.t(:"member_state.#{state}")}"
  end
  
  protected
  def send_invitation
    UserMailer.invitation(self).deliver
  end
end
