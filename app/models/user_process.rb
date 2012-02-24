class UserProcess < ActiveRecord::Base
  attr_accessor :recipients
  validates_presence_of :title, :message, :owner, :recipients
  
  has_many :process_members, :dependent => :delete_all, :foreign_key => :process_id
  has_many :process_attachments, :dependent => :delete_all, :foreign_key => :process_id
  
  after_create :add_members
  
  def add_members
    uniq = true
    recipients.each_value do |val|
      member = ProcessMember.new({:role_id=>val["role"], :email=>val["email"], :process_id=>id, :state=>"delivered" })
      member.save
      uniq = false if val["email"] == owner
    end
    unless uniq.blank? 
      member = ProcessMember.new({:role_id=>2, :email=>owner, :process_id=>id, :state=>"delivered" })
      member.save
    end
  end
  
  def get_owner_token_url
    Crypto.encrypt("#{owner}:#{2}:#{id}")
  end
  
  def self.decrypt_token_url(url)
    hash = {:mail=>"", :role_id=>"", :process_id=>""}
    begin
      arr = Crypto.decrypt(url).split(":")
    rescue 
	    arr = false
  	end
    hash = {:mail=>arr[0], :role_id=>arr[1], :process_id=>arr[2]} unless arr.blank?
    
    hash
  end
  
end
